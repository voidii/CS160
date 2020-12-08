#include <stdint.h>

#include <string>
#include <unordered_set>
#include <stdexcept>

// Called by the garbage collector after each collection to report the
// statistics about the heap after garbage collection.
void ReportGCStats(size_t liveObjects, size_t liveWords);

// Thrown by Alloc if the L2 program has run out of memory.
struct OutOfMemoryError : public std::runtime_error {
  OutOfMemoryError() : runtime_error("Out of memory.") {}
};

// Implements a semispace garbage collector for L2 programs.
class GcSemiSpace {
 public:
  // The 'frame_ptr' argument should be the frame pointer for the stack frame of
  // 'main', i.e., the stack frame immediately before the stack frame of 'Entry'
  // for the L2 program. The 'heap_size' argument is the number of desired words
  // in the heap; it should be a positive even number.
  GcSemiSpace(intptr_t* frame_ptr, int heap_size_in_words);
  //~GcSemiSpace();

  // Allocates num_words+1 words on the heap and returns the address of the
  // second word. The first word (at a negative offset from the returned
  // address) is intended to be the 'header word', which should be filled in by
  // the L2 program with the correct type information.
  //
  // `curr_frame_ptr` is the frame pointer for the last frame in the
  // L2 program. It is needed for when the garbage collector is
  // walking the stack.
  //
  // Throws 'OutOfMemoryError' if the heap runs out of memory.
  intptr_t* Alloc(int32_t num_words, intptr_t * curr_frame_ptr);
  void collect(intptr_t* fp);
  //void walkStack(intptr_t* fp);
  //void readbit(intptr_t* curr_fp,int word,int offset);
  intptr_t* copy(intptr_t* r);
  //void swap(intptr_t* f,intptr_t* t);
  //void struct_copy(intptr_t* ptr);

 private:
  // Your private methods for functionality such as garbage collection, stack walking, and copying live data should go here
  //to / From / allocPtr / heap size / semi-space size / ptr to From / ptr to To
  intptr_t *based_fp,*myHeap,*from,*to,*bump_ptr,*alloc_ptr;
  int heap_size,semi_size;
  size_t live_obj,live_word;
  std::unordered_set<intptr_t*> roots;
  // Your private methods for functionality such as garbage
  // collection, stack walking, and copying live data should go here
};
