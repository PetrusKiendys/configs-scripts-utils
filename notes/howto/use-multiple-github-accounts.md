
How-To (TL;DR)
======================
Here's a quick breakdown on how to set up multiple GitHub accounts on a per-repository basis.  
The full guide is provided after this section.

1.) Start by modifying your ~/.ssh/config file.

Add the following:

    # GitHub as 'subaccount'
    Host *github.com-subaccount*
        HostName github.com
        User subaccount
        PreferredAuthentications publickey
        IdentityFile /home/myuser/.ssh/id_rsa_subaccount
        IdentitiesOnly yes

Change the following (for your main account):

	Host *github.com*
	-->
	Host *github.com* !*github.com-subaccount*

2.) Clone the repository that you want to contribute to with your 'subaccount' identity, but change the SSH URL.

Add `-subaccount` to the domain part:

	git@github.com:subaccount/somerepo.git
	-->
	git@github.com-subaccount:subaccount/somerepo.git

3.) Navigate into the repo and change your username and email.

        cd /path/to/somerepo/
        git config user.name "subaccount_name"
        git config user.email "subaccount_email"


How-To (full guide)
======================
This how-to describes how to use multiple GitHub accounts on a per-repository basis.
The guide can be generalized to any git hosting platform, but for this example we will look at setting up an alternate account for a specific repository on GitHub.  
I will in detail explain some of the inner workings of SSH configuration, using git via the command line and GitHub account usage.

1.) Start by modifying your `~/.ssh/config` file.

If you're using SSH keys to clone, pull and push to GitHub then you should have your SSH config set up something like this:

    # GitHub as 'mainaccount'
    Host *github.com*
        HostName github.com
        User mainaccount
        PreferredAuthentications publickey
        IdentityFile /home/myuser/.ssh/id_rsa
        IdentitiesOnly yes

Let's add your other account 'subaccount' to the mix.  
Place it over your 'mainaccount' in the SSH config file, as the config is read from top to bottom.  

If you don't have a separate SSH key for your 'subaccount' identity, then go ahead and generate it first:  
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#generating-a-new-ssh-key

    # GitHub as 'subaccount'
    Host *github.com-subaccount*
        HostName github.com
        User subaccount
        PreferredAuthentications publickey
        IdentityFile /home/myuser/.ssh/id_rsa_subaccount
        IdentitiesOnly yes

<!-- FIX: Not sure if you actually have to explicitly exclude like this every time you want to add another account..
          There SHOULD be a way to not have to exclude the `Host` of other accounts from your 'mainaccount',
          but this is the only way I'm getting it to work, I'll update this part if I figure out how to avoid doing this. -->

Go back to the SSH config of your 'mainaccount' and change the `Host` entry for it:

	Host *github.com*
	-->
	Host *github.com* !*github.com-subaccount*

The reason why we have to explicitly exclude your 'subaccount' from the `Host` entry of your 'mainaccount' is so that
it will actually use the SSH key (IdentityFile) of your 'subaccount' when committing to specific repositories,
otherwise it will try to use the SSH key of your 'mainaccount' and fail to push commits due to refused access.

To be clear, in the SSH config, the `Host` entry is a kind of matching string used to determine which URLs during SSH connections should be tied with what part of your SSH config file.
As you will see soon, we will modify the `git clone` SSH URL to match the new section `Host *github.com-subaccount*` that we added for 'subaccount'.  
In contrast `HostName` is used to resolve or specify the actual host name to establish an SSH connection to, can be both a URL or a numeric IP address.  
More about SSH config entries can be read under the section "Understanding ~/.ssh/config entries" here:  
https://www.cyberciti.biz/faq/create-ssh-config-file-on-linux-unix/

2.) Clone the repository that you want to contribute to with your 'subaccount' identity.

But don't git clone the URL as is. Instead modify the URL so that it matches the `Host` part of your newly added SSH config section.  
Let's take a look at how a remote SSH URL usually looks like.

Example:  
	`git@github.com:JohnDoe/JohnsRepository.git`, is on the form:  
	`git@<domain>:<github_user>/<repo_name>.git`

What we want to do is change the `domain` part so that it matches the `Host` part of 'subaccount' SSH config:

	git@github.com:subaccount/somerepo.git
	-->
	git@github.com-subaccount:subaccount/somerepo.git

This will work assuming that there is a repository called 'somerepo' on GitHub by the user 'subaccount'.  
Notice that we're setting `github.com-subaccount` as the domain, even though it won't resolve to anything in the browser.  
It will be matched to our SSH config section for 'subaccount' and the actual host name (or domain) is specified by `HostName github.com`.

Simply `git clone` the repo now with the correct SSH key.  

	git clone git@github.com-subaccount:subaccount/somerepo.git

3.) Navigate into the repo and change your username and email.

`cd /path/to/somerepo/`

You may have a global git `user.name` and `user.email` set in `~/home/myuser/.gitconfig`.  
Let's override those values only locally for the repository we just cloned so that we can contribute as 'subaccount',  
set the name and email of the user:

    git config user.name "subaccount_name"
    git config user.email "subaccount_email"

Make sure that you set the exact email address of the 'subaccount' in order to have commits be linked to that user.  
GitHub uses the email address set in your local Git configuration to associate commits pushed from the command line with your GitHub account.  
More about this here:  
https://help.github.com/articles/setting-your-commit-email-address-in-git/#setting-your-email-address-for-a-single-repository

You're all set, now you can contribute to specific repositories as identities held by accounts other than your main account!
