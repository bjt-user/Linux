#### push to gitlab
```
git push --repo https://gitlab.com/bjt-user1/Linux
```
then you will be asked for username and password

#### push without entering username and password?

FAIL: git config --global user.name myusername?
=> nope, doesnt work

```
git config --global credential.helper store
```
then
```
git push
```
and enter credentials again (it remembers them)

=> worked like a charm!
(credentials are stored in ~/.git-credentials.)

#### Pulling

Once you have cloned the repository you can't clone again to update the content.
The following command seems to work:
```
git pull origin
```
I get one warning with redirecting to `...https://gitlab.com/bjt-user1/Linux.git`\
So I changed the `.git/config` to `https://gitlab.com/bjt-user1/Linux.git`\
=> it worked (no more warnings)

After that first time it worked to just type:
```
git pull
```

Sometimes you get this weird warning when doing a `git pull`:
```
warning: Pulling without specifying how to reconcile divergent branches is
discouraged.
```
To get rid of the warning I would do the following command:
```
git config --global pull.ff only
```
This makes sure that the `pull` does not create a new commit.\
Which is weird because I would never want a `pull` to create a new commit.

The long answer is here: \
https://stackoverflow.com/questions/62653114/how-can-i-deal-with-this-git-warning-pulling-without-specifying-how-to-reconci

#### make vim your standard editor for commit messages
```
git config --global core.editor "vim"
```
(or change the contents of ~/.gitconfig)

#### show the current branch you are in

```
git branch
```

or
```
git rev-parse --abbrev-ref HEAD
```

or
```
git show
```
(and look at the first line and the string after HEAD->)

this works at least when you did not make changes:
```
git status
```

```
git branch -a
```
(in detached head mode you need a different command)


#### How to switch branches

```
git checkout -b [branchname]
```

this also works:
```
git checkout master
```


#### clone a specific branch of a repo (not master)
```
git clone -b <branch> <remote_repo>
```

#### You can check if you have added the remote as HTTPS or SSH using
```
git remote -v
```

#### git add
```
git add -p
```
The `-p` option for `git add` is really handy, because you can look through parts of your changes and confirm each one.

#### go back to the commit (and discard modifications)

Changes that HAVE been added can be resettet with this:
```
git reset
```
Changes that haven't been added.
If you want to discard this type of changes, you can use the git restore command:
```
git restore index.html
```
or to restore all files in the current folder:
```
git restore .
```

#### undo a commit

this creates a new commit but undoes the changes from the commit-id provided:
```
git revert <commit-id>
```

This goes back to the commit with the SHA b8457dd\
(look with `git log -n3 --oneline` at your last commits and the SHAs)
```
git reset --hard b8457dd
```
#### Show changes Since Last Commit

To see changes since last commit (that were not added yet):
```
git diff
```
or (if you are in a shitty terminal i.e. PowerShell):
```
git diff --no-color
```

#### history

```
git log --pretty=oneline
```
or to see only the last 3 commits and hex codes with a length of 8:
```
git log -n3 --oneline
```

show the number of commits in the repository:
```
git log --oneline | wc -l
```

clone without history:
```
git clone --depth=1 https://gitlab.com/bjt-user/Linux.git
```
(you can just delete the `.git` folder after that to not make it a git repo anymore)

#### tab completion (for changing branches i.e.)
```
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
```
put this into your `~/.bashrc`
```
source ~/git-completion.bash
```

Now you can do
```
git switch 6<tab>
```
and branch name will be autocompleted.

#### delete a branch

To Force Delete a Local Branch:
```
git branch -D <branch-name>
```

delete branch remotely
```
git push origin --delete remoteBranchName
```
#### squash commits

https://www.youtube.com/watch?v=V5KrD7CmO4o&ab_channel=TheModernCoder

Squashing commits locally did work,\
but `git push` did not work.

```
 git reset --soft [hexcode of initial commit]
```
This squashes all commits. But you still have to `git push --force`...
```
remote: GitLab: You are not allowed to force push code to a protected branch on this project.
```

In `gitlab` master branches are protected by default.\
Go to `settings` in the left menu on the bottom.\
Go to `repository`. There you can `unprotect` the master branch.

#### download a single file from a gitlab repo
click on the file on gitlab, click on raw and copy the link\
or just write `/-/raw/[branchname]/[filename]` after the repo link\
then use wget:
```
wget https://gitlab.com/bjt-user/Linux/-/raw/master/vimrc
```
