# syntax=docker/dockerfile:1

# docker-cx-freeze - Docker configuration for cx_Freeze.
# Written in 2024 by Hubert Bielenia <13271065+hbielenia@users.noreply.github.com>
# To the extent possible under law, the author(s) have dedicated all copyright and related
# and neighboring rights to this software to the public domain worldwide. This software
# is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

FROM python:3.12-windowsservercore-1809@sha256:828cd05029317faa1c3e4ed79dabbb955416009b8588112f6078579ebb0b9d96
ARG CX_FREEZE_COMMIT_SHA=d8e990bd975f56c73ede3b0e42102e201c901ba3
RUN mkdir c:\\Users\\ContainerUser\\SourceCode
WORKDIR c:\\
RUN powershell -Command " \
	$ErrorActionPreference = 'Stop'; \
	Invoke-WebRequest https://github.com/marcelotduarte/cx_Freeze/archive/$Env:CX_FREEZE_COMMIT_SHA.zip -OutFile cxfreeze.zip; \
	Expand-Archive cxfreeze.zip cx_Freeze-$Env:CX_FREEZE_COMMIT_SHA; \
	Remove-Item -Path cxfreeze.zip; \
"
RUN python -m pip install --disable-pip-version-check -e .\\cx_Freeze-$Env:CX_FREEZE_COMMIT_SHA\\cx_Freeze-$Env:CX_FREEZE_COMMIT_SHA\\
WORKDIR c:\\Users\\ContainerUser\\SourceCode
CMD ["cxfreeze"]
