# syntax=docker/dockerfile:1

# docker-cx-freeze - Docker configuration for cx_Freeze.
# Written in 2024 by Hubert Bielenia <13271065+hbielenia@users.noreply.github.com>
# To the extent possible under law, the author(s) have dedicated all copyright and related
# and neighboring rights to this software to the public domain worldwide. This software
# is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

FROM python:3.12-windowsservercore-1809@sha256:832c24f5cfb7e32ae00821f479db02b400b4d0ac1d808166cb41725192c434c3 AS install
ARG CX_FREEZE_COMMIT_SHA=7a1ef98d38b60e127c17a1ea0a6fd6eac75b1071
WORKDIR c:\\
RUN powershell -Command "Invoke-WebRequest https://github.com/marcelotduarte/cx_Freeze/archive/$Env:CX_FREEZE_COMMIT_SHA.zip -OutFile cxfreeze.zip"
RUN powershell -Command "Expand-Archive cxfreeze.zip cxfreeze"
RUN python -m pip install --disable-pip-version-check ./cxfreeze/cx_Freeze-$Env:CX_FREEZE_COMMIT_SHA/

FROM python:3.12-windowsservercore-1809@sha256:832c24f5cfb7e32ae00821f479db02b400b4d0ac1d808166cb41725192c434c3
COPY --from=install c:\\Python c:\\Python\\
RUN mkdir c:\\Users\\ContainerUser\\SourceCode
WORKDIR c:\\Users\\ContainerUser\\SourceCode
CMD ["cxfreeze"]
