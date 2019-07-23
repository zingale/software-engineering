# A Walkthrough of Git and GIthub

This is a simple walkthrough on how you might interact with git on
your own workstation and then import your project to github for
collaboration.

## Standalone Git

A single-user interaction with git:

* Make your project

  We'll start by making our project directory and moving into it:

  ```
  $ mkdir myproject
  $ cd myproject/
  ```

* Now have git track this

  Now we do `git init .` -- this tells git to initialize this
  directory under version control

  ```
  $ git init
  ```

  If we do `ls` at this point, we see nothing.  However, there is a
  "hidden" directory called `.git/` which we can see by passing `-a`
  to `ls`:

  ```
  $ ls -al
  $ ls -l .git
  ```

  In that directory are the files that git uses to keep track of
  changes and the history.

* Create a file

  We'll create a file called `README` (use whatever editor you like,
  I'll use emacs):

  ```
  $ emacs -nw README
  ```

  Add some descriptive text to the file and save it.  At the moment,
  git doesn't know about this file -- you can see this via `git
  status`:

  ```
  $ git status
  ```

* Tell git about the file

  Now we need to tell git to start tracking the file.  We use
  `git add` for this.  Then we need to tell git to store the current
  state of the file -- we use `git commit` for this:

  ```
  $ git add README
  $ git commit README
  ```

  Notice that an editor window pops up -- take the time to give a
  descriptive message about the changes.

  If you make more changes to the file, git won't store them until
  you commit them.  So you'll commit the same file over and over as
  it changes, but only add it once.

* Create another file

  Let's create a python program, `awesome.py` with the line:

  ```
  print("hello")
  ```

  Now add that file and commit it too

  ```
  $ git add awesome.py
  $ git commit .
  ```

* Look at your log

  `git log` will show you all the commits, the message you entered
  when you made the commit (that helps you understand what was done).
  It will also have a "hash" next to the commit (like
  `dbc2916bb609759d54ca7668558bc639bab9b60b`)

  ```
  $ git log
  ```

* Add to you code

  Edit `awesome.py` and make it a function and have your program call
  the function.  Now we need to commit this again:

  ```
  $ git commit awesome.py
  ```

  And `git log` will show this commit as separate from the one we made
  when we created the file.

* Go back in time

  Suppose our code is not working anymore, and we know it was in the
  past.  We can go back to any previous version of the code by using
  `checkout` and the hash next to that commit (note: your hashes will
  be different than mine).

  ```
  $ git log
  $ git checkout dbc2916bb609759d54ca7668558bc639bab9b60b
  ```

  Look at the file, and you'll see it is different.

  If you want to go back to the latest version, you can checkout `master`
  -- that's the name of the main "branch" git recognizes.

  ```
  git checkout master
  ```

## Importing to Github

* Now we want to put our project on github so others can see it, use
  it, and collaborate with you.

    1. Log onto your github account and in the upper right, click on
       the "+" menu and select "New Repository".

    2. On the next screen, make the repository name the same as our
       local project, "myproject".

    3. We'll leave everything else alone, since we are going to import
       a project.

  Github tells us what to do next.  We'll follow the "..or push an
  exisiting repository from the command line".

  In our local repository, we will do:

  ```
  git remote add origin git@github.com:zingale/myproject.git
  git push -u origin master
  ```

  (You might see it give you this in terms of `https` instead of an
  ssh login, depending on how you configured github.)

* Refresh your github webpage and you will see your project files now!

* Working with remotes:

  Github appears as a "remote" for us.  We can see this via:
  ```
  git remote -v
  ```

  Any changes we make on our local repo are only reflected in the remote
  repository after we `push`.

  Let's see this--we'll make some new changes to `awesome.py` and
  commit:
  ```
  emacs -nw awesome.py
  git commit awesome.py
  ```

  If you reload the github page, you'll see that your changes are not
  reflected there.

  To sync your local changes with the remote repo, we need to push:
  ```
  git push
  ```

## Working with branches

Suppose we want to do some development that might be invasive and we
don't want to break the working code on "master".  We can use a
branch for this -- thing of this as a parallel development that can
track the master branch and merge back and forth with it.  We can
work on this new branch until we are happy, and then incorporate our
changes back to `master`.

* Let's create a new branch called `development`:

  ```
  $ git checkout -b development
  ```

* Now make some changes to `awesome.py` and commit them.

  ```
  $ emacs -nw awesome.py
  $ git commit awesome.py
  ```

* If you go back to `master`, you won't see these changes:

  ```
  $ git checkout master
  $ more awesome.py
  ```

## Pull Requests

Git is based around pulling changes from other repos.  The standard
method we do this with codes hosted on github is via "pull requests".
We'll do this first with our own repo, since we have complete control
over it.  (Note: if we were working on our own, we could merge just on
the commandline.)

* Push our new branch to github:
  ```
  git checkout development
  git push
  ```
  This fails, because the remote (upstream) does not know about our new
  branch.  But git tells us how to fix this, to push this branch to
  our remote and make the remote the upstream:
  ```
  git push --set-upstream origin development
  ```

  If we look at github, we can see our new branch.

* Create a pull request:

  1. Click on the "pull requests" tab under the project name and then
     click on "new pull request".

     (github may be smart enough to recognize that there is a recent
     change that you might want to merge).

  2. In the drop-down menus at the top, keep the base as `master` and
     change compare to `development`.

  3. Click on "create pull request" and add whatever comments you want
     and click on "create pull request"

* Merge the pull request:

  We'll automatically be taken to the pull request page (it is called #1),
  and we can review it and once we are ready merge it.

* Pull the changes to our local copy.

  Our local repo is now behind github.  To get the changes that we made
  to master, we can do:
  ```
  git checkout master
  git pull
  ```

## Forking a Project and Doing a Pull Request

Pull requests are our only option when we want to make changes to a repo
that we don't have write access to.  We'll practice on a repo I setup:

https://github.com/zingale/cca_practice

* Click on the "fork" button in the upper right.  Follow the prompts
  and it will create a copy in your account.

* Now you are ready to work with it.  At a command prompt on your
  computer (assuming you are running linux or OSX), do:
  ```
  git clone https://github.com/your-username/cca_practice.git
  ```
  where "your-username" is your github account name.  Note that this
  URL is what appears on the page of your forked repo.

  This will create a directory on your machine called `cca_practice/`

* Make any additions you wish.  I suggest creating a file with your
  initials in the name, so we avoid conflicts.

* Push your changes back to your forked repo by typing:
  ```
  git push
  ```

* Do a pull request:

  Note that your forked repo is not kept in sync with the main class
  repo.  Go to your github page and click on your fork of
  `cca_practice`.  Now, click on the green "New pull request" button.
  This will identify all of the differences between your version of
  the code and my version of the repo.  You can then click on "Create
  pull request" and notification will be sent to the main project that
  you wish for your changes to be merged.

