include ./env.mk

# 编译器
ifneq ($(CPU),stm32mp1)
	ifeq ($(PLATFORM),arm)
		
		PREFIX = arm-openstlinux_eglfs-linux-gnueabi-
		
	else
		PREFIX =
	endif
	CC = $(PREFIX)gcc
	STRIP=$(PREFIX)strip
endif

# 文件路径包含
INCPATH += -I src -I bin -I lib -I src/connect/serial -I src/connect/socket
INCLUDES = $(INCPATH)

vpath %.c bin lib src src/connect/serial src/connect/socket
vpath %.h bin lib src src/connect/serial src/connect/socket

# 目标
## 过程文件
$(OUTDIR)/%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

TEMP_OBJS += main.o serial.o socket.o

## 最终目标
all: outdir test

outdir:
	@mkdir -p $(OUTDIR)

test: outdir $(OUTDIR)/test

$(OUTDIR)/test: $(addprefix $(OUTDIR)/,$(notdir $(TEMP_OBJS)))
	@echo "building application $(@F)"
	$(CC) $(LDFLAGS) $(CFLAGS) $(INCLUDES) $^ -o $@
	
clean:
	rm -f *.o
	rm -f -r build
	
distclean: clean



