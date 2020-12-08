#include "gc.h"
#include <iostream>
#include <cassert>
#include <cstdio>
#include <sstream>
#include <iomanip>
#include <stdio.h>
#include <string.h>
#include <cstring>

using std::unordered_set;


// Initialize GC data structures and allocate space for the heap
//fp cannot be nullptr; heap size is positive & even num
GcSemiSpace::GcSemiSpace(intptr_t* frame_ptr, int heap_size_in_words){
  assert(frame_ptr!=nullptr && "Base frame pointer should not be a `nullptr`");
  assert((heap_size_in_words >=0 && heap_size_in_words%2 ==0)&&"Heap size should be positive and even");
  assert(sizeof(intptr_t)==4 && "Words must be 4-byte long");

  based_fp = frame_ptr;
  heap_size = heap_size_in_words;
  semi_size = heap_size_in_words >> 1;
  myHeap = new intptr_t[heap_size_in_words];

  from = myHeap;
  to = myHeap + semi_size;

  bump_ptr = from;
  alloc_ptr = to;

}

//Allocate "num_words+1",return a pointer to second words
intptr_t* GcSemiSpace::Alloc(int32_t num_words, intptr_t * curr_frame_ptr) {
  assert(num_words>0 && "Num of words must greater than 0");
  assert((bump_ptr>= from && bump_ptr<=from+semi_size)&&"Bump pointer should point to somewhere in the from space" );
  intptr_t* output;
  if(bump_ptr +num_words+1>from+semi_size){ 
    collect(curr_frame_ptr);
  }
  if(bump_ptr +num_words+1>from+semi_size){ 
    throw OutOfMemoryError();
  }

  output=bump_ptr+1;
  bump_ptr=bump_ptr+num_words+1;
 
  return output;
}

void GcSemiSpace::collect(intptr_t* fp){
  //walk the stack to get the root set
  //walkStack(fp);
  //copy the reachable objects into `to` space, starting from the root set.
  intptr_t arg_info_word, local_info_word;
  roots.clear();
  while(fp < based_fp){
    arg_info_word = *(fp - 1);
    //readbit(fp,arg_info_word,2);
    for(int i = 0 ; i < 32 ; i++){
        if(arg_info_word & 1){
            roots.insert(fp + 2 + i);
        }
        arg_info_word >>= 1;
    }
    local_info_word = *(fp - 2);
    //readbit(fp,local_info_word, -3);
    for(int i = 0 ; i < 32 ; i++){
        if(local_info_word & 1){//find pointer
            roots.insert(fp - 3 - i);
        }
        local_info_word >>= 1;
    }
    fp = (intptr_t*) *fp;
  }
  for(intptr_t* i:roots){
    i = copy(i);
  }
  //swap "from" and "to"
  intptr_t* temp= from;
  from= to;
  to = temp;
  bump_ptr=alloc_ptr;
  alloc_ptr=to;
  //call reportGCStatus
  ReportGCStats(live_obj,live_word);
  live_obj=0;
  live_word=0;
}

//void GcSemiSpace::walkStack(intptr_t* fp){
//  intptr_t arg_info_word, local_info_word;
//  roots.clear();
//  while(fp < based_fp){
//    arg_info_word = *(fp - 1);
//    readbit(fp,arg_info_word,2);
//    local_info_word = *(fp - 2);
//    readbit(fp,local_info_word, -3);
//    fp = (intptr_t*) *fp;
//  }
//}

//void GcSemiSpace::readbit(intptr_t* curr_fp,int word,int offset){
//  for(int i=0;i<32;i++){
//    if(word & 1){//find pointer
//      if(offset > 0){//in arg
//        roots.insert(curr_fp + offset + i);
//      }
//      if(offset < 0){//in local
//        roots.insert(curr_fp + offset - i);
//      }
//  }
//    word >>= 1;
//  }
//}


intptr_t* GcSemiSpace::copy(intptr_t* r){
  intptr_t header,num_words;
  intptr_t* tmp = (intptr_t*) *r;
  if(tmp==NULL) return tmp;
  header=*(tmp-1);
  if(header&1){
    num_words=header>>24;
    live_obj ++;
    live_word=live_word+num_words+1;

    //add forward pointer
    intptr_t* temp=alloc_ptr;
    intptr_t* forward=alloc_ptr+1;
    alloc_ptr=alloc_ptr+num_words+1;
    *temp=header;

    for(int i=0;i<num_words;i++){
      *(temp+i+1)=*(tmp+i);
    }
    *r=(intptr_t) forward;
    *(tmp-1)=(intptr_t) forward;

    intptr_t lastbit=header>>1;
    for(int i=0;i<num_words;i++){
      if(lastbit&1){
        intptr_t* heap_ptr=temp+i+1;
        heap_ptr=copy(heap_ptr);
      }
      lastbit>>=1;
    }
    return r;
  }
  *r=header;
  return r;

}







