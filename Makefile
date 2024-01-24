CC = gcc
CXX = clang++
RM = rm -f

ABSL_LIBS=                         \
  -labsl_str_format_internal       \
  -labsl_strings                   \
  -labsl_strings_internal          \
  -labsl_log_initialize            \
  -labsl_log_entry                 \
  -labsl_log_flags                 \
  -labsl_log_severity              \
  -labsl_log_internal_check_op     \
  -labsl_log_internal_conditions   \
  -labsl_log_internal_message      \
  -labsl_log_internal_nullguard    \
  -labsl_log_internal_proto        \
  -labsl_log_internal_format       \
  -labsl_log_internal_globals      \
  -labsl_log_internal_log_sink_set \
  -labsl_log_sink                  \
  -labsl_raw_logging_internal      \
  -labsl_log_globals               \
  -lutf8_validity                  \
  -labsl_cord                      \
  -labsl_cordz_info                \
  -labsl_cordz_handle              \
  -labsl_cordz_functions           \
  -labsl_cord_internal             \
  -labsl_crc_cord_state            \
  -labsl_crc32c                    \
  -labsl_crc_internal              \
  -labsl_exponential_biased        \
  -labsl_synchronization           \
  -labsl_time                      \
  -labsl_time_zone                 \
  -labsl_int128                    \
  -labsl_examine_stack             \
  -labsl_stacktrace                \
  -labsl_symbolize                 \
  -labsl_demangle_internal         \
  -labsl_debugging_internal        \
  -labsl_malloc_internal           \
  -labsl_throw_delegate            \
  -labsl_strerror                  \
  -labsl_raw_hash_set              \
  -labsl_hash                      \
  -labsl_city                      \
  -labsl_low_level_hash            \
  -labsl_base                      \
  -labsl_spinlock_wait

CXXFLAGS = --std=c++17 -pthread -g -O3 -MMD -MP
CPPFLAGS = -I/usr/local/include/
LDFLAGS = -L/usr/local/lib
LDLIBS = -lprotobuf $(ABSL_LIBS)

TARGET = main

SRCS = $(wildcard *.cpp) $(wildcard *.pb.cc)
OBJS = $(subst .pb.cc,.pb.o,$(subst .cpp,.o,$(SRCS)))
DEPS = $(subst .pb.cc,.pb.d,$(subst .cpp,.d,$(SRCS)))

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS)

clean:
	$(RM) $(OBJS) $(DEPS) $(PROGRAM_NAME)