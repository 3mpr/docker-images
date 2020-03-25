#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <sys/types.h>
#include <errno.h>

#include "errors.h"
#include "ename.c.inc" /* Defines ename and MAX_ENAME */

#define BUF_SIZE 1024

static void
output_error (bool use_err, int err, bool flush_stdout, const char *format,
  va_list ap) {
  char buf[BUF_SIZE], user_msg[BUF_SIZE / 2], err_text[BUF_SIZE / 2];

  /* Formatting */
  vsnprintf(user_msg, BUF_SIZE / 2, format, ap);
  if (use_err) {
    snprintf(err_text, BUF_SIZE / 2, " [%s %s]",
      (err > 0 && err <= MAX_ENAME) ? ename[err] : "?UNKNOWN?", strerror(err)
    );
  } else snprintf(err_text, BUF_SIZE / 2, ":");

  snprintf(buf, BUF_SIZE, "%s%s\n", err_text, user_msg); // Check for ERROR prefix
  if (flush_stdout) fflush(stdout);

  fputs(buf, stderr);
  fflush(stderr);
}

void
fatal (const char* format, ...) {
  va_list arg_list;

  va_start(arg_list, format);
  output_error(false, 0, true, format, arg_list);
  va_end(arg_list);

  exit(EXIT_FAILURE);
}

void
terminate(const char *format, ...) {
  va_list arg_list;

  va_start(arg_list, format);
  output_error(true, errno, false, format, arg_list);
  va_end(arg_list);

  exit(EXIT_FAILURE);
}

void
usage_error(const char* format, ...) {
  va_list arg_list;

  fflush(stdout);

  fprintf(stderr, "Usage: ");
  va_start(arg_list, format);
  vfprintf(stderr, format, arg_list);
  va_end(arg_list);

  fflush(stderr);

  exit(EXIT_FAILURE);
}
