#include "gc.h"

#include <cstring>
#include <algorithm>
using namespace std;

// Helpers for Frame
static intptr_t frame_header(intptr_t* frame) {
    return *(frame - 1);
}

static intptr_t* next_frame(intptr_t* frame) {
    return (intptr_t*)(*frame);
}

static size_t frame_size(intptr_t* frame) {
    return frame_header(frame) >> 24;
}

static intptr_t frame_argument_info(intptr_t* frame) {
    return *(frame - 1);
}

static intptr_t frame_local_info(intptr_t* frame) {
    return *(frame -2);
}

GcSemiSpace::GcSemiSpace(intptr_t* frame_ptr, int heap_size_in_words) {
    start_ = new intptr_t[heap_size_in_words];

    frame_end_ = frame_ptr;
    half_heap_size_ = heap_size_in_words >> 1;

    from_space_ = start_;
    to_space_ = start_ + half_heap_size_;

    bump_ptr_ = from_space_;
    alloc_ptr_ = to_space_;

    live_objects_ = 0;
    live_words_ = 0;
}

GcSemiSpace::~GcSemiSpace() {
    delete[] start_;
}

intptr_t* GcSemiSpace::Alloc(int32_t num_words, intptr_t* curr_frame_ptr) {
    int32_t alloc_size = num_words + 1;

    if (bump_ptr_ + alloc_size > from_space_ + half_heap_size_) {
        _collect(curr_frame_ptr);

        ReportGCStats(live_objects_, live_words_);

        live_objects_ = 0;
        live_words_ = 0;
    }

    if (bump_ptr_ + alloc_size > from_space_ + half_heap_size_) {
        throw OutOfMemoryError();
    }

    auto addr = bump_ptr_ + 1;
    bump_ptr_ += alloc_size;

    return addr;
}

void GcSemiSpace::_collect(intptr_t* curr_frame_ptr) {
    unordered_set<intptr_t*> root_set;

    // walk [curr_frame_ptr, frame_end_)
    for (auto frame = curr_frame_ptr; frame < frame_end_; frame = next_frame(frame)) {
        auto argument_info = frame_argument_info(frame);
        auto local_info = frame_local_info(frame);

        for (int i = 0; i < 32; argument_info >>= 1, local_info >>= 1, ++i) {
            if (argument_info & 1) {
                root_set.emplace(frame + i + 2);
            }

            if (local_info & 1) {
                root_set.emplace(frame - i - 3);
            }
        }
    }

    for (auto root: root_set) {
        _copy(root);
    }

    swap(from_space_, to_space_);
    bump_ptr_ = alloc_ptr_;
    alloc_ptr_ = to_space_;
}

void GcSemiSpace::_copy(intptr_t* root) {
    auto frame = next_frame(root);

    if (!frame) {
        return;
    }

    auto frmhdr = frame_header(frame);
    if (frmhdr % 2 == 0) {
        *root = frmhdr;
        return;
    }

    auto size = frame_size(frame);
    _update_stats(size);

    auto new_frame = alloc_ptr_ + 1;
    memcpy(alloc_ptr_, frame - 1, (size + 1) * sizeof(intptr_t));
    alloc_ptr_ += size + 1;

    *root = (intptr_t)new_frame;
    *(frame - 1) = *root;

    _copy_ref(new_frame);
}

void GcSemiSpace::_copy_ref(intptr_t* frame) {
    auto size = frame_size(frame);
    auto is_ref = frame_header(frame) >> 1;
    for (auto i = 0u; i < size; is_ref >>= 1, ++i) {
        if (is_ref & 1) {
            _copy(frame + i);
        }
    }
}

void GcSemiSpace::_update_stats(size_t size) {
    live_objects_ += 1;
    live_words_ += size + 1;
}

