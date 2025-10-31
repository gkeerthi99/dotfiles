import re

replacements = {
    "#dc8a78": "#f92672",
    "#dd7878": "#f92672",
    "#ea76cb": "#ae81ff",
    "#8839ef": "#ae81ff",
    "#d20f39": "#f92672",
    "#e64553": "#f92672",
    "#fe640b": "#fd971f",
    "#df8e1d": "#e6db74",
    "#40a02b": "#a6e22e",
    "#179299": "#a6e22e",
    "#04a5e5": "#66d9ef",
    "#209fb5": "#66d9ef",
    "#1e66f5": "#66d9ef",
    "#7287fd": "#66d9ef",
    "#4c4f69": "#161613",
    "#5c5f77": "#1d1e19",
    "#6c6f85": "#1d1e19",
    "#7c7f93": "#272822",
    "#8c8fa1": "#3b3c35",
    "#9ca0b0": "#57584f",
    "#acb0be": "#6e7066",
    "#bcc0cc": "#919288",
    "#ccd0da": "#c0c1b5",
    "#dce0e8": "#c0c1b5",
    "#e6e9ef": "#fdfff1",
    "#eff1f5": "#fdfff1",

    "#232634": "#161613",  # crust
    "#292c3c": "#1d1e19",  # mantle
    "#303446": "#272822",  # base / background
    "#414559": "#3b3c35",  # surface0
    "#51576d": "#57584f",  # surface1
    "#626880": "#6e7066",  # surface2
    "#737994": "#919288",  # overlay0
    "#838ba7": "#c0c1b5",  # overlay1
    "#949cbb": "#c0c1b5",  # overlay2
    "#a5adce": "#c0c1b5",  # subtext0
    "#b5bfe2": "#fdfff1",  # subtext1
    "#c6d0f5": "#fdfff1",  # text
    "#506373": "#c0c1b5",
    "#f2d5cf": "#f92672",  # rosewater
    "#eebebe": "#f92672",  # flamingo
    "#f4b8e4": "#ae81ff",  # pink
    "#ca9ee6": "#ae81ff",  # mauve
    "#e78284": "#f92672",  # red
    "#ea999c": "#f92672",  # maroon
    "#ef9f76": "#fd971f",  # peach
    "#e5c890": "#e6db74",  # yellow
    "#a6d189": "#a6e22e",  # green
    "#81c8be": "#a6e22e",  # teal
    "#99d1db": "#66d9ef",  # sky
    "#85c1dc": "#66d9ef",  # sapphire
    "#8caaee": "#66d9ef",  # blue
    "#babbf1": "#ae81ff",  # lavender

}

with open("Catppuccin Frappe.tmTheme", "r") as f:
    data = f.read()

for old, new in replacements.items():
    data = re.sub(old, new, data, flags=re.IGNORECASE)

with open("Custom.tmTheme", "w") as f:
    f.write(data)

print("✅ Theme colors replaced and saved as Custom.tmTheme")

# dark1 = "#1d1e19",
# dark2 = "#161613",
# background = "#272822",
# text = "#fdfff1",
# accent1 = "#f92672",
# accent2 = "#fd971f",
# accent3 = "#e6db74",
# accent4 = "#a6e22e",
# accent5 = "#66d9ef",
# accent6 = "#ae81ff",
# dimmed1 = "#c0c1b5",
# dimmed2 = "#919288",
# dimmed3 = "#6e7066",
# dimmed4 = "#57584f",
# dimmed5 = "#3b3c35",
