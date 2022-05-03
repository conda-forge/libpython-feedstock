:: Create an empty library for msvcrt??? since CygwinCCompiler seems to
:: think that linking to that is a good idea (it is not).
ar cru %PREFIX%\libs\libmsvcr140.dll.a
ar cru %PREFIX%\libs\libucrt.dll.a
ar cru %PREFIX%\libs\libvcruntime140.dll.a

if "%python_impl%" == "pypy" (
  if "%PY_VER%" == "3.8" (
    gendef.exe %PREFIX%\libpypy3-c.dll - > python%CONDA_PY%.def
  ) else (
    gendef.exe %PREFIX%\libpypy%PY_VER%-c.dll - > python%CONDA_PY%.def
  )
  if errorlevel 1 exit 1
) else (
  gendef.exe %PREFIX%\python%CONDA_PY%.dll - > python%CONDA_PY%.def
  if errorlevel 1 exit 1
)
dlltool.exe -d python%CONDA_PY%.def -l %PREFIX%\libs\libpython%CONDA_PY%.dll.a
if errorlevel 1 exit 1
if not exist %PREFIX%\Lib\distutils\ mkdir %PREFIX%\Lib\distutils\
if errorlevel 1 exit 1
echo [build_ext]           > %PREFIX%\Lib\distutils\distutils.cfg
if errorlevel 1 exit 1
echo define=MS_WIN64      >> %PREFIX%\Lib\distutils\distutils.cfg
if errorlevel 1 exit 1
echo compiler=mingw32     >> %PREFIX%\Lib\distutils\distutils.cfg
if errorlevel 1 exit 1

copy %PREFIX%\Lib\distutils\distutils.cfg %PREFIX%\Lib\site-packages\setuptools\_distutils\
