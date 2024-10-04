# syntax=docker/dockerfile:1

# docker-cx-freeze - Docker configuration for cx_Freeze.
# Written in 2024 by Hubert Bielenia <13271065+hbielenia@users.noreply.github.com>
# To the extent possible under law, the author(s) have dedicated all copyright and related
# and neighboring rights to this software to the public domain worldwide. This software
# is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

FROM python:3.11-windowsservercore-1809@sha256:6c579f77d1b9407bebde36ce0d345cc576b6ffa5e6e75538517c7b50171258f0 AS install
WORKDIR c:\\
RUN powershell -Command "Invoke-WebRequest https://github.com/marcelotduarte/cx_Freeze/archive/7a1ef98d38b60e127c17a1ea0a6fd6eac75b1071.zip -OutFile cxfreeze.zip"
RUN powershell -Command "Expand-Archive cxfreeze.zip cxfreeze"
RUN python -m pip install --disable-pip-version-check ./cxfreeze/cx_Freeze-7a1ef98d38b60e127c17a1ea0a6fd6eac75b1071/

FROM python:3.11-windowsservercore-1809@sha256:6c579f77d1b9407bebde36ce0d345cc576b6ffa5e6e75538517c7b50171258f0
COPY --from=install c:\\Python c:\\Python\\
RUN mkdir c:\\Users\\ContainerUser\\SourceCode
WORKDIR c:\\Users\\ContainerUser\\SourceCode
CMD ["cxfreeze"]
