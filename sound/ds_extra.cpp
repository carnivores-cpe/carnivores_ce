
// alacn ->

#include <windows.h>


int __stdcall DllMain(HINSTANCE hInstance, DWORD dwReason, void*)
{
	return 1;
}



extern HANDLE hlog;


int Audio_GetVersion()
{
	return 0x00010002;
}


void Audio_SetEnvironment(int, float)
{
}


void PrintLog(LPSTR l)
{
	DWORD w;
	
	if (l[strlen(l)-1]==0x0A) {
		BYTE b = 0x0D;
		WriteFile(hlog, l, strlen(l)-1, &w, NULL);
		WriteFile(hlog, &b, 1, &w, NULL);
		b = 0x0A;
		WriteFile(hlog, &b, 1, &w, NULL);
	} else
		WriteFile(hlog, l, strlen(l), &w, NULL);

}


// <- alacn
