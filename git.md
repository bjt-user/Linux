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
I get one warning with redirecting to ...https://gitlab.com/bjt-user1/Linux.git
So I changed the .git/config to https://gitlab.com/bjt-user1/Linux.git
=> it worked (no more warnings)

After that first time it worked to just type:
```
git pull
```

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
#### Show changes Since Last Commit

To see changes since last commit (that were not added yet):
```
git diff
```
or (if you are in a shitty terminal i.e. PowerShell):
```
git diff --no-color
```

#### show history (all commits)

```
git log --pretty=oneline
```

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
