#-*-mode:makefile-gmake;indent-tabs-mode:t;tab-width:8;coding:utf-8-*-┐
#── vi: set noet ft=make ts=8 sw=8 fenc=utf-8 :vi ────────────────────┘

PKGS += LLAMA_CPP_LLAVA

LLAMA_CPP_LLAVA_FILES := $(wildcard llama.cpp/llava/*)
LLAMA_CPP_LLAVA_HDRS = $(filter %.h,$(LLAMA_CPP_LLAVA_FILES))
LLAMA_CPP_LLAVA_SRCS = $(filter %.cpp,$(LLAMA_CPP_LLAVA_FILES))
LLAMA_CPP_LLAVA_OBJS = $(LLAMA_CPP_LLAVA_SRCS:%.cpp=o/$(MODE)/%.o)

.PHONY: tool/args/args.h

o/$(MODE)/llama.cpp/llava/llava.a:				\
		$(LLAMA_CPP_LLAVA_OBJS)

o/$(MODE)/llama.cpp/llava/llava-quantize:			\
		o/$(MODE)/llama.cpp/llava/llava-quantize.o	\
		o/$(MODE)/llama.cpp/llava/llava.a		\
		o/$(MODE)/llama.cpp/llama.cpp.a

.PHONY: o/$(MODE)/llama.cpp/llava
o/$(MODE)/llama.cpp/llava:					\
		o/$(MODE)/llama.cpp/llava/llava.a		\
		o/$(MODE)/llama.cpp/llava/llava-quantize
