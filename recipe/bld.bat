if not exist %PREFIX%\Lib\distutils\ mkdir %PREFIX%\Lib\distutils\
if errorlevel 1 exit 1
echo [build_ext]           > %PREFIX%\Lib\distutils\distutils.cfg
if errorlevel 1 exit 1
echo define=MS_WIN64      >> %PREFIX%\Lib\distutils\distutils.cfg
if errorlevel 1 exit 1
echo compiler=mingw32     >> %PREFIX%\Lib\distutils\distutils.cfg
if errorlevel 1 exit 1

copy %PREFIX%\Lib\distutils\distutils.cfg %PREFIX%\Lib\site-packages\setuptools\_distutils\
