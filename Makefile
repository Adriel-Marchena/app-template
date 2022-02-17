# Alternative GNU Make workspace makefile autogenerated by Premake

ifndef config
  config=debug_x64
endif

ifndef verbose
  SILENT = @
endif

ifeq ($(config),debug_x64)
  stb_image_config = debug_x64
  GLFW_config = debug_x64
  ImGui_config = debug_x64
  Glad_config = debug_x64
  Game_config = debug_x64

else ifeq ($(config),debug_x86)
  stb_image_config = debug_x86
  GLFW_config = debug_x86
  ImGui_config = debug_x86
  Glad_config = debug_x86
  Game_config = debug_x86

else ifeq ($(config),release_x64)
  stb_image_config = release_x64
  GLFW_config = release_x64
  ImGui_config = release_x64
  Glad_config = release_x64
  Game_config = release_x64

else ifeq ($(config),release_x86)
  stb_image_config = release_x86
  GLFW_config = release_x86
  ImGui_config = release_x86
  Glad_config = release_x86
  Game_config = release_x86

else ifeq ($(config),dist_x64)
  stb_image_config = dist_x64
  GLFW_config = dist_x64
  ImGui_config = dist_x64
  Glad_config = dist_x64
  Game_config = dist_x64

else ifeq ($(config),dist_x86)
  stb_image_config = dist_x86
  GLFW_config = dist_x86
  ImGui_config = dist_x86
  Glad_config = dist_x86
  Game_config = dist_x86

else
  $(error "invalid configuration $(config)")
endif

PROJECTS := stb_image GLFW ImGui Glad Game

.PHONY: all clean help $(PROJECTS) Dependencies

all: $(PROJECTS)

Dependencies: GLFW Glad ImGui stb_image

stb_image:
ifneq (,$(stb_image_config))
	@echo "==== Building stb_image ($(stb_image_config)) ===="
	@${MAKE} --no-print-directory -C Game/vendor/stb_image -f Makefile config=$(stb_image_config)
endif

GLFW:
ifneq (,$(GLFW_config))
	@echo "==== Building GLFW ($(GLFW_config)) ===="
	@${MAKE} --no-print-directory -C Game/vendor/glfw -f Makefile config=$(GLFW_config)
endif

ImGui:
ifneq (,$(ImGui_config))
	@echo "==== Building ImGui ($(ImGui_config)) ===="
	@${MAKE} --no-print-directory -C Game/vendor/imgui -f Makefile config=$(ImGui_config)
endif

Glad:
ifneq (,$(Glad_config))
	@echo "==== Building Glad ($(Glad_config)) ===="
	@${MAKE} --no-print-directory -C Game/vendor/glad -f Makefile config=$(Glad_config)
endif

Game: GLFW stb_image Glad ImGui
ifneq (,$(Game_config))
	@echo "==== Building Game ($(Game_config)) ===="
	@${MAKE} --no-print-directory -C Game -f Makefile config=$(Game_config)
endif

clean:
	@${MAKE} --no-print-directory -C Game/vendor/stb_image -f Makefile clean
	@${MAKE} --no-print-directory -C Game/vendor/glfw -f Makefile clean
	@${MAKE} --no-print-directory -C Game/vendor/imgui -f Makefile clean
	@${MAKE} --no-print-directory -C Game/vendor/glad -f Makefile clean
	@${MAKE} --no-print-directory -C Game -f Makefile clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "  debug_x64"
	@echo "  debug_x86"
	@echo "  release_x64"
	@echo "  release_x86"
	@echo "  dist_x64"
	@echo "  dist_x86"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   stb_image"
	@echo "   GLFW"
	@echo "   ImGui"
	@echo "   Glad"
	@echo "   Game"
	@echo ""
	@echo "For more information, see https://github.com/premake/premake-core/wiki"