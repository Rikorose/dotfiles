#!/usr/bin/env python3

import argparse
import os
import json
from urllib.request import urlopen, urlretrieve
from urllib.parse import urljoin


BING_URL = "https://www.bing.com"


def json_url(n=1, mkt="en-US"):
    return urljoin(BING_URL, f"HPImageArchive.aspx?format=js&idx=0&n={n}&mkt={mkt}")


def download_wallpaper(args):
    with urlopen(json_url(mkt=args.mkt)) as f:
        data = json.load(f)
        url = data["images"][0]["url"]
    urlretrieve(urljoin(BING_URL, url), filename=os.path.expanduser(args.dest))


if __name__ == "__main__":
    # Parse arguments
    parser = argparse.ArgumentParser(description="Download BING wallpaper of the day.")
    parser.add_argument(
        "-d",
        "--dest",
        help="the directory to download to (default: ~/wallpaper)",
        type=str,
        default="~/wallpaper",
    )
    parser.add_argument(
        "-m", "--mkt", help="Market of BING wallpaper feed.", type=str, default="en-US"
    )
    download_wallpaper(parser.parse_args())
