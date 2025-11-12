# Getting Started with LOT Terminal

**Welcome!** This guide will help you get started with LOT Terminal, even if you've never used a terminal before.

## What is LOT Terminal?

**LOT Terminal – an open-source platform for self-care hardware**

LOT Terminal helps you:
- Manage your personal settings
- Track your activities with logs
- Organize hardware projects
- Learn terminal commands

Think of it as your personal workspace in the terminal!

## Step 1: Installation

### On Mac or Linux

1. Open your Terminal app
2. Copy and paste this command, then press Enter:

```bash
curl -sSL https://raw.githubusercontent.com/vadikmarmeladov/lot-terminal/main/install.sh | bash
```

3. Wait for the installation to complete
4. Close and reopen your Terminal

That's it! LOT Terminal is now installed.

## Step 2: First Time Setup

Type this command and press Enter:

```bash
lot init
```

This creates your personal workspace at `~/.lot/` (a hidden folder in your home directory).

## Step 3: Your First Commands

Try these simple commands:

### See what you can do
```bash
lot help
```
This shows all available commands.

### Check if everything is working
```bash
lot status
```
You should see green checkmarks!

### View your version
```bash
lot version
```

## Step 4: Personalize Your Settings

### Edit your settings
```bash
lot config
```

This opens your personal settings file. You can change:
- Your name
- Email address
- Preferences

**How to edit:**
- Use arrow keys to move around
- Type to add text
- Press `Ctrl+X` to exit
- Press `Y` to save
- Press `Enter` to confirm

### Quick settings commands

Set your name:
```bash
lot settings set LOT_USER_NAME "YourName"
```

See all your settings:
```bash
lot settings list
```

## Step 5: Create Your First User Profile

User profiles help you organize different configurations:

```bash
lot user create alice
```

See all your users:
```bash
lot user list
```

## Step 6: Start a Hardware Project (Optional)

If you're building electronics or IoT projects:

```bash
lot hardware init my-first-project
```

This creates a organized folder with spaces for:
- Firmware code
- Circuit schematics
- PCB designs
- Documentation
- Photos

See your projects:
```bash
lot hardware list
```

## Common Commands Cheat Sheet

| What you want to do | Command to type |
|---------------------|-----------------|
| Get help | `lot help` |
| Check system | `lot status` |
| Edit settings | `lot config` |
| View settings | `lot settings list` |
| Create user | `lot user create NAME` |
| List users | `lot user list` |
| View logs | `lot logs` |
| Check statistics | `lot stats` |
| Start hardware project | `lot hardware init NAME` |
| List projects | `lot hardware list` |

## Understanding the Terminal

### What is a command?
A command is like giving instructions to your computer. You type it and press Enter.

Example:
```
lot status
```
- `lot` = the program name
- `status` = what you want it to do

### What are those symbols?

- `~` = Your home folder (like /Users/yourname)
- `/` = Separates folders (like subfolders)
- `.` = Current folder
- `..` = Parent folder (one level up)

### Where are my files?

All LOT Terminal files are stored in:
```
~/.lot/
```

The `.` at the start means it's hidden. To see it:
```bash
ls -la ~/
```

## Viewing Your Logs

Every action is recorded! View your activity:

```bash
lot logs
```

Watch live activity:
```bash
lot logs tail
```
(Press `Ctrl+C` to stop watching)

## Tips for Beginners

### 1. Don't worry about breaking things
You can't damage your computer with LOT Terminal. Worst case, you can delete `~/.lot/` and start fresh!

### 2. Use Tab to autocomplete
Start typing a command and press `Tab`. It will complete it for you!

### 3. Use the Up arrow
Press the Up arrow key to see your previous commands. No need to retype!

### 4. Copy and paste
- **Mac:** `Cmd+C` to copy, `Cmd+V` to paste
- **Linux:** `Ctrl+Shift+C` to copy, `Ctrl+Shift+V` to paste

### 5. Clear your screen
Type `clear` to clean up your terminal screen.

### 6. Get back home
Type `cd ~` to go back to your home folder.

## Troubleshooting

### "Command not found: lot"

Try:
1. Close and reopen your Terminal
2. Or run: `source ~/.bashrc` (or `source ~/.zshrc` on Mac)
3. Or reinstall using the installation command

### "Permission denied"

Try adding `bash` before the command:
```bash
bash install.sh
```

### "No such file or directory"

You might be in the wrong folder. Go to your home folder:
```bash
cd ~
```

### Need more help?

Run the health check:
```bash
lot doctor
```

This will tell you if anything is wrong.

## Example: Complete Beginner Workflow

Here's what a first session might look like:

```bash
# Install LOT Terminal (already done!)
# Now let's set it up:

lot init
# ✅ Creates your workspace

lot settings set LOT_USER_NAME "Alice"
# ✅ Sets your name

lot user create alice
# ✅ Creates your first profile

lot hardware init weather-station
# ✅ Creates your first project

lot stats
# ✅ See what you've created!

lot logs
# ✅ See everything you did
```

## What's Next?

Now that you know the basics:

1. **Explore commands** - Try `lot help` to see everything
2. **Customize settings** - Make it yours with `lot config`
3. **Start a project** - Build something with `lot hardware init`
4. **Read more docs** - Check out [README.md](README.md) for advanced features

## Need More Help?

- **Full documentation:** [README.md](README.md)
- **Hardware guide:** [HARDWARE.md](HARDWARE.md)
- **Report issues:** https://github.com/vadikmarmeladov/lot-terminal/issues
- **Ask questions:** https://github.com/vadikmarmeladov/lot-terminal/discussions

## Quick Reference Card

Print this and keep it next to your computer!

```
┌─────────────────────────────────────────┐
│        LOT TERMINAL QUICK START         │
├─────────────────────────────────────────┤
│ Setup                                   │
│   lot init          First time setup    │
│   lot status        Check if working    │
│                                         │
│ Settings                                │
│   lot config        Edit settings       │
│   lot settings list View all settings   │
│                                         │
│ Users                                   │
│   lot user create   Create new user     │
│   lot user list     Show all users      │
│                                         │
│ Hardware                                │
│   lot hardware init Create project      │
│   lot hardware list Show projects       │
│                                         │
│ Information                             │
│   lot help          All commands        │
│   lot logs          View activity       │
│   lot stats         Statistics          │
│   lot doctor        Health check        │
└─────────────────────────────────────────┘
```

## Remember

- 🔓 **This is open source** - You can see and modify all the code
- 🛠️ **It's a playground** - Experiment and learn!
- 🔌 **Great for hardware** - Perfect for Arduino, Raspberry Pi, ESP32 projects
- 📝 **Everything is logged** - You can always see what you did

**Happy exploring!** 🚀

---

*New to terminals? That's okay! Everyone starts somewhere. Take it slow, try commands one at a time, and don't be afraid to experiment.*
