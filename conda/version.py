import os, glob
path = os.path.dirname(__file__)
os.chdir(path)
f = glob.glob("*.AppImage")[0]
v = "FreeCAD_0.18_Conda_Py3Qt5_glibc2.12-x86_64.AppImage"
os.rename(os.path.join(path, f), os.path.join(path, v))
exit(0)
