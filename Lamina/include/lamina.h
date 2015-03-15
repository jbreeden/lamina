#ifndef LAMINA_H
#define LAMINA_H

#if __cplusplus
extern "C" {
#endif

void lamina_set_url(char* url);
void lamina_set_sub_process(char* sub_process_name);
int lamina_start(int argc, char** argv);

#if __cplusplus
}
#endif

#endif /* LAMINA_H */