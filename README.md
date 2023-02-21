# ppa

Experimenting with using a PPA for managing apps.

## Why

To centrally manage versions of certain apps 
on any Linux box or container I use.

This repo publishes a PPA at https://ppa.nick-santos.com/.

## Installation

```
curl -s --compressed "https://ppa.nick-santos.com/KEY.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/nick-santos.gpg > /dev/null
sudo curl -s --compressed -o /etc/apt/sources.list.d/nick-santos.list "https://ppa.nick-santos.com/nick-santos.list"
sudo apt update
```

## Credits

Inspired by this blog post by Adsaf Morami
https://assafmo.github.io/2019/05/02/ppa-repo-hosted-on-github.html

## License

Copyright 2023 Nick Santos

Licensed under [the Apache License, Version 2.0](LICENSE)
