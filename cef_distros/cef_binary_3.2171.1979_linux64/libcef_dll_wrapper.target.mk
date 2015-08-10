# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := libcef_dll_wrapper
DEFS_Debug := \
	'-DV8_DEPRECATION_WARNINGS' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DCHROMIUM_BUILD' \
	'-DTOOLKIT_VIEWS=1' \
	'-DUI_COMPOSITOR_IMAGE_TRANSPORT' \
	'-DUSE_AURA=1' \
	'-DUSE_ASH=1' \
	'-DUSE_PANGO=1' \
	'-DUSE_CAIRO=1' \
	'-DUSE_GLIB=1' \
	'-DUSE_DEFAULT_RENDER_THEME=1' \
	'-DUSE_LIBJPEG_TURBO=1' \
	'-DUSE_X11=1' \
	'-DUSE_CLIPBOARD_AURAX11=1' \
	'-DENABLE_ONE_CLICK_SIGNIN' \
	'-DENABLE_PRE_SYNC_BACKUP' \
	'-DUSE_XI2_MT=2' \
	'-DENABLE_REMOTING=1' \
	'-DENABLE_WEBRTC=1' \
	'-DENABLE_PEPPER_CDMS' \
	'-DENABLE_CONFIGURATION_POLICY' \
	'-DENABLE_NOTIFICATIONS' \
	'-DUSE_UDEV' \
	'-DENABLE_EGLIMAGE=1' \
	'-DENABLE_TASK_MANAGER=1' \
	'-DENABLE_EXTENSIONS=1' \
	'-DENABLE_PLUGINS=1' \
	'-DENABLE_SESSION_SERVICE=1' \
	'-DENABLE_THEMES=1' \
	'-DENABLE_AUTOFILL_DIALOG=1' \
	'-DENABLE_BACKGROUND=1' \
	'-DENABLE_GOOGLE_NOW=1' \
	'-DCLD_VERSION=2' \
	'-DCLD2_DATA_SOURCE=static' \
	'-DENABLE_FULL_PRINTING=1' \
	'-DENABLE_PRINTING=1' \
	'-DENABLE_SPELLCHECK=1' \
	'-DENABLE_CAPTIVE_PORTAL_DETECTION=1' \
	'-DENABLE_APP_LIST=1' \
	'-DENABLE_SETTINGS_APP=1' \
	'-DENABLE_MANAGED_USERS=1' \
	'-DENABLE_MDNS=1' \
	'-DENABLE_SERVICE_DISCOVERY=1' \
	'-DENABLE_LOAD_COMPLETION_HACKS=1' \
	'-DUSING_CEF_SHARED' \
	'-DUSE_NSS=1' \
	'-D__STDC_CONSTANT_MACROS' \
	'-D__STDC_FORMAT_MACROS' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=1' \
	'-DWTF_USE_DYNAMIC_ANNOTATIONS=1' \
	'-D_DEBUG' \
	'-D_GLIBCXX_DEBUG=1'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fstack-protector \
	--param=ssp-buffer-size=4 \
	-Werror \
	-pthread \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-B/data/Jenkins/workspace/CEF3-Linux-2171/download/chromium/src/third_party/binutils/Linux_x64/Release/bin \
	-m64 \
	-march=x86-64 \
	-O0 \
	-g \
	-gdwarf-4 \
	-funwind-tables

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-exceptions \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare

INCS_Debug := \
	-I$(obj)/gen \
	-I.

DEFS_Release := \
	'-DV8_DEPRECATION_WARNINGS' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DCHROMIUM_BUILD' \
	'-DTOOLKIT_VIEWS=1' \
	'-DUI_COMPOSITOR_IMAGE_TRANSPORT' \
	'-DUSE_AURA=1' \
	'-DUSE_ASH=1' \
	'-DUSE_PANGO=1' \
	'-DUSE_CAIRO=1' \
	'-DUSE_GLIB=1' \
	'-DUSE_DEFAULT_RENDER_THEME=1' \
	'-DUSE_LIBJPEG_TURBO=1' \
	'-DUSE_X11=1' \
	'-DUSE_CLIPBOARD_AURAX11=1' \
	'-DENABLE_ONE_CLICK_SIGNIN' \
	'-DENABLE_PRE_SYNC_BACKUP' \
	'-DUSE_XI2_MT=2' \
	'-DENABLE_REMOTING=1' \
	'-DENABLE_WEBRTC=1' \
	'-DENABLE_PEPPER_CDMS' \
	'-DENABLE_CONFIGURATION_POLICY' \
	'-DENABLE_NOTIFICATIONS' \
	'-DUSE_UDEV' \
	'-DENABLE_EGLIMAGE=1' \
	'-DENABLE_TASK_MANAGER=1' \
	'-DENABLE_EXTENSIONS=1' \
	'-DENABLE_PLUGINS=1' \
	'-DENABLE_SESSION_SERVICE=1' \
	'-DENABLE_THEMES=1' \
	'-DENABLE_AUTOFILL_DIALOG=1' \
	'-DENABLE_BACKGROUND=1' \
	'-DENABLE_GOOGLE_NOW=1' \
	'-DCLD_VERSION=2' \
	'-DCLD2_DATA_SOURCE=static' \
	'-DENABLE_FULL_PRINTING=1' \
	'-DENABLE_PRINTING=1' \
	'-DENABLE_SPELLCHECK=1' \
	'-DENABLE_CAPTIVE_PORTAL_DETECTION=1' \
	'-DENABLE_APP_LIST=1' \
	'-DENABLE_SETTINGS_APP=1' \
	'-DENABLE_MANAGED_USERS=1' \
	'-DENABLE_MDNS=1' \
	'-DENABLE_SERVICE_DISCOVERY=1' \
	'-DENABLE_LOAD_COMPLETION_HACKS=1' \
	'-DUSING_CEF_SHARED' \
	'-DUSE_NSS=1' \
	'-D__STDC_CONSTANT_MACROS' \
	'-D__STDC_FORMAT_MACROS' \
	'-DNDEBUG' \
	'-DNVALGRIND' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=0' \
	'-D_FORTIFY_SOURCE=2'

# Flags passed to all source files.
CFLAGS_Release := \
	-fstack-protector \
	--param=ssp-buffer-size=4 \
	-Werror \
	-pthread \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-B/data/Jenkins/workspace/CEF3-Linux-2171/download/chromium/src/third_party/binutils/Linux_x64/Release/bin \
	-m64 \
	-march=x86-64 \
	-O2 \
	-fno-ident \
	-fdata-sections \
	-ffunction-sections \
	-funwind-tables

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-exceptions \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare

INCS_Release := \
	-I$(obj)/gen \
	-I.

OBJS := \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_atomicops_x86_gcc.o \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_bind_helpers.o \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_callback_helpers.o \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_callback_internal.o \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_lock.o \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_lock_impl.o \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_logging.o \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_ref_counted.o \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_string16.o \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_thread_checker_impl.o \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_thread_collision_warner.o \
	$(obj).target/$(TARGET)/libcef_dll/base/cef_weak_ptr.o \
	$(obj).target/$(TARGET)/libcef_dll/transfer_util.o \
	$(obj).target/$(TARGET)/libcef_dll/wrapper/cef_byte_read_handler.o \
	$(obj).target/$(TARGET)/libcef_dll/wrapper/cef_closure_task.o \
	$(obj).target/$(TARGET)/libcef_dll/wrapper/cef_message_router.o \
	$(obj).target/$(TARGET)/libcef_dll/wrapper/cef_stream_resource_handler.o \
	$(obj).target/$(TARGET)/libcef_dll/wrapper/cef_xml_object.o \
	$(obj).target/$(TARGET)/libcef_dll/wrapper/cef_zip_archive.o \
	$(obj).target/$(TARGET)/libcef_dll/wrapper/libcef_dll_wrapper.o \
	$(obj).target/$(TARGET)/libcef_dll/wrapper/libcef_dll_wrapper2.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/allow_certificate_error_callback_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/app_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/auth_callback_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/before_download_callback_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/binary_value_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/browser_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/browser_host_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/browser_process_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/callback_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/client_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/command_line_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/completion_callback_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/context_menu_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/context_menu_params_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/cookie_manager_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/cookie_visitor_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/domdocument_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/domnode_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/domvisitor_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/dialog_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/dictionary_value_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/display_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/download_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/download_item_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/download_item_callback_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/drag_data_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/drag_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/end_tracing_callback_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/file_dialog_callback_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/focus_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/frame_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/geolocation_callback_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/geolocation_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/get_geolocation_callback_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/jsdialog_callback_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/jsdialog_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/keyboard_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/life_span_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/list_value_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/load_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/menu_model_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/navigation_entry_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/navigation_entry_visitor_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/post_data_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/post_data_element_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/print_dialog_callback_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/print_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/print_job_callback_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/print_settings_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/process_message_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/quota_callback_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/read_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/render_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/render_process_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/request_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/request_context_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/request_context_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/request_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/resource_bundle_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/resource_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/response_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/run_file_dialog_callback_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/scheme_handler_factory_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/scheme_registrar_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/stream_reader_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/stream_writer_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/string_visitor_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/task_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/task_runner_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/urlrequest_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/urlrequest_client_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/v8accessor_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/v8context_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/v8exception_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/v8handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/v8stack_frame_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/v8stack_trace_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/v8value_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/web_plugin_info_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/web_plugin_info_visitor_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/web_plugin_unstable_callback_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/cpptoc/write_handler_cpptoc.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/xml_reader_ctocpp.o \
	$(obj).target/$(TARGET)/libcef_dll/ctocpp/zip_reader_ctocpp.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-Wl,-z,now \
	-Wl,-z,relro \
	-Wl,--fatal-warnings \
	-pthread \
	-Wl,-z,noexecstack \
	-fPIC \
	-B/data/Jenkins/workspace/CEF3-Linux-2171/download/chromium/src/third_party/binutils/Linux_x64/Release/bin \
	-Wl,--disable-new-dtags \
	-m64

LDFLAGS_Release := \
	-Wl,-z,now \
	-Wl,-z,relro \
	-Wl,--fatal-warnings \
	-pthread \
	-Wl,-z,noexecstack \
	-fPIC \
	-B/data/Jenkins/workspace/CEF3-Linux-2171/download/chromium/src/third_party/binutils/Linux_x64/Release/bin \
	-Wl,--disable-new-dtags \
	-m64 \
	-Wl,-O1 \
	-Wl,--as-needed \
	-Wl,--gc-sections

LIBS := \
	

$(obj).target/libcef_dll_wrapper.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/libcef_dll_wrapper.a: LIBS := $(LIBS)
$(obj).target/libcef_dll_wrapper.a: TOOLSET := $(TOOLSET)
$(obj).target/libcef_dll_wrapper.a: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,alink_thin)

all_deps += $(obj).target/libcef_dll_wrapper.a
# Add target alias
.PHONY: libcef_dll_wrapper
libcef_dll_wrapper: $(obj).target/libcef_dll_wrapper.a

# Add target alias to "all" target.
.PHONY: all
all: libcef_dll_wrapper

