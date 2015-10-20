## 2do

This is a command line implementation of a ToDo List. It's inspired on the git workflow and the main goal is to be part of the developer routine.

### Examples

#### Initialize category

2do new **today**
2do new **this-week**
2do new **later**

#### Add a task into a category
{% codeblock  lang=bash %}
2do @ today "Finish the read me section of 2do."
2do @ today "Plan the whole interface to be geekie friendly"
2do @ this-week "Revisit the whole interface to double check"
2do @ later "Implement it all"
2do @ later "Release the Kraken"
{%endcodeblock%}

#### List all the category's tasks

2do list today

It will display the tasks added to **today** category. By default it prints at most 5 tasks.

--- 2 tasks todo today ---

  [ ] Finish the read me section of 2do.
  [ ] Plan the whole interface to be geekie friendly

You can change the max task value:

2do list today -10

Or if you want to see all the tasks:

2do list today -all

### List tasks from all categories

2do list

--- 2 tasks todo today ---

  [ ] Finish the read me section of 2do.
  [ ] Plan the whole interface to be geekie friendly

--- 1 task todo this-week ---

  [ ] Revisit the whole interface to double check

--- 2 tasks todo later ---

  [ ] Implement it all
  [ ] Release the Kraken

#### Select next task to work on

2do next-from today

It will retrieve the first open task from category **today**.

--- 2do next from today ---

  Finish the read me section of 2do.

In case no category is specified it will be displayed the first open task found from the first to the lastest add category.
Which means it will look on today category for an open task if finds, will display on screen else it will look on the next category.

Pro tip:
  **next-from** is a quite big param, so you can use the shorter version **-nf**

#### Tagging tags (Opened, On progress and Done)

Given you have the task hash it is possible to set a status to it:

Setting a task as **on progress**

2do task start {hash}

Setting a task as **done**

2do done task {hash}

Resetting a task as **open**

2do task opened {hash}

As you set the status to your tasks it will change the output of the **2do list** to something like: 

2do list

--- 2 tasks todo today ---

  [√] Finish the read me section of 2do.
  [√] Plan the whole interface to be geekie friendly

--- 1 task todo this-week ---

  [.] Revisit the whole interface to double check

--- 2 tasks todo later ---

  [ ] Implement it all
  [ ] Release the Kraken

#### Stash tasks

Once you accumulate tasks you may want to exclude them or maybe  stash them so in the future you can review all you have done.

To stash a single task:

2do stash {hash}

or to a group of tasks:

2do stash done tasks from today

2do stash on progress tasks from this-week

Then those tasks won't show anymore, until of course, you execute a recover.

#### Recover tasks

Recover will bring back the stashed tasks.

To recover a single task:

2do recover {hash}

Or to recover multiple tasks:

2do recover open tasks from later

For **stash** and **recover** when no category is specified the changes will be applied to all categories.

#### Remove task

To remove forever!

2do remove task {hash}

Annnnd it's gone.

#### Remove a category

2do remove category today

Annnnd it's gone.
