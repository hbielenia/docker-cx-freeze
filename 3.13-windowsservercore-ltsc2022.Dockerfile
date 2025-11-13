# syntax=docker/dockerfile:1

# docker-cx-freeze - Docker configuration for cx_Freeze.
# Written in 2024 by Hubert Bielenia <hbielenia@users.noreply.github.com>
# To the extent possible under law, the author(s) have dedicated all copyright and related
# and neighboring rights to this software to the public domain worldwide. This software
# is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

FROM python:3.13-windowsservercore-ltsc2022@sha256:6d8bb9195200234491174373e597e0b8c5468694c77ed06dcdb45c04a5770171
ARG CX_FREEZE_COMMIT_SHA=c33f4df63a03bfcff3366a30e3c24879d5defb1f
RUN mkdir c:\\Users\\ContainerUser\\SourceCode
WORKDIR c:\\
RUN powershell -Command " \
	Invoke-WebRequest https://github.com/marcelotduarte/cx_Freeze/archive/$Env:CX_FREEZE_COMMIT_SHA.zip -OutFile cxfreeze.zip; \
	Expand-Archive cxfreeze.zip cx_Freeze-$Env:CX_FREEZE_COMMIT_SHA; \
	Remove-Item -Path cxfreeze.zip; \
"
RUN python -m pip install --disable-pip-version-check -e .\\cx_Freeze-$Env:CX_FREEZE_COMMIT_SHA\\cx_Freeze-$Env:CX_FREEZE_COMMIT_SHA\\
WORKDIR c:\\Users\\ContainerUser\\SourceCode
CMD ["cxfreeze"]
