new-repo-automation
=                  

# This is still work in progress
**TODO:** *fix some bugs for not submitting README.md to the repo*


<br />

### What is this for? ###
Since creating new Github repo require a lot of work, 
and I want to create it just from my terminal, 
so I made this bash shell script to do the work and automate the repetition task.



### How to use it ###
* first, make sure you have your `Github token` ready.
* clone this repo
* make the script executable
```
$ chmod +x github-create-repo.sh
```

* Change your github username, your github [token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) before executing the script.

* Run it and add your new repo name
```
$ ./github-create-repo.sh my-new-repo
```

It will ask whether you want to make this repo public (Y/n). 
If you choose 'n', it will make it private repo.

After that, this script will make a new directory in your current dir/path, 
with the name of the new repo that you type just now.

It will also init it with `git init`, create `README.md` file, 
add it and push it to your new repo.

Finally it will run `git log`.



<br />

:::::::::::::::::
### Awareness ###
:::::::::::::::::

Keep this file save, and can't be accessed from unwanted parties since you have your token within the file.

This is just a quick solution, later on I will try to make it with another way such as using SSH keys or GPG keys. Maybe also this file will become two files, where your token will be in a separate file, and set appropriate permissions and restrict access to a token file.

You can use the `'chmod'` command. Here's an example:
```
$ chmod 600 path/to/token_file
```

It is better that this script file is not in the same folder/path after you download it through git clone.
