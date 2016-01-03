# resolveip

A bash script to determine the IP of a hostname


## Dependencies

Requires: getent (linux) or dscacheutil (mac)


## Usage

```
resolveip.sh <hostname>
```

Example (external IP of local machine):

```
hostname -f | xargs resolveip.sh
```


## License

Copyright 2015 Karl Isenberg

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.