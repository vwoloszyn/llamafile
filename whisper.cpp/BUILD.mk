#-*-mode:makefile-gmake;indent-tabs-mode:t;tab-width:8;coding:utf-8-*-┐
#── vi: set noet ft=make ts=8 sw=8 fenc=utf-8 :vi ────────────────────┘

PKGS += WHISPER_CPP

WHISPER_CPP_FILES := $(wildcard whisper.cpp/*.*)
WHISPER_CPP_HDRS = $(filter %.h,$(WHISPER_CPP_FILES))
WHISPER_CPP_INCS = $(filter %.inc,$(WHISPER_CPP_FILES))
WHISPER_CPP_SRCS_C = $(filter %.c,$(WHISPER_CPP_FILES))
WHISPER_CPP_SRCS_CPP = $(filter %.cpp,$(WHISPER_CPP_FILES))
WHISPER_CPP_SRCS = $(WHISPER_CPP_SRCS_C) $(WHISPER_CPP_SRCS_CPP)

WHISPER_CPP_OBJS =					\
	$(WHISPER_OBJS)				\
	$(WHISPER_SRCS_C:%.c=o/$(MODE)/%.o)		\
	$(WHISPER_CPP_SRCS_CPP:%.cpp=o/$(MODE)/%.o)	\
	$(WHISPER_CPP_FILES:%=o/$(MODE)/%.zip.o)

o/$(MODE)/whisper.cpp/whisper.cpp.a: $(WHISPER_CPP_OBJS)




#main: examples/main/main.cpp $(SRC_COMMON) $(WHISPER_OBJ)
#	$(CXX) $(CXXFLAGS) examples/main/main.cpp $(SRC_COMMON) $(WHISPER_OBJ) -o main $(LDFLAGS)
#./main -h

#o/$(MODE)/whisper.cpp/examples/main/main.cpp.a: $(LLAMA_CPP_OBJS)

#.PHONY: o/$(MODE)/whisper.cpp
o/$(MODE)/whisper.cpp: 					\
		o/$(MODE)/whisper.cpp/main		\
