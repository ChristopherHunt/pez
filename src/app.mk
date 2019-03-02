include $(base_dir)/src/common.mk

ld_libs := $(addprefix $(base_dir)/lib/, $(app_libs))

$(app): $(ldlibs) $(objs)
	$(CXX) $(CXXFLAGS) -o $@ $(objs) $(LDFLAGS) $(ld_libs)
	cp $@ $(bin_dir)
