# HW4

How was your experience making this app?
Good exercise.  It wasnt obvious from the writeup about a detail text field at the bottom right.  Didnt realize until a classmate mentioned about having two text fields.  Tried to use a text view for the detail field but was having trouble saving to the right item in the array, replacing the textview with a text field using exactly the same code fixed the problem.  Still dont understand what was wrong but have spent way too many hours and still couldnt make sense of the behavior so gave up.

What resources did you find helpful?
http://stackoverflow.com/questions/2455161/unrecognized-selector-sent-to-instance
http://stackoverflow.com/questions/20927451/get-indexpath-row-from-tableview-objective-c
http://www.wenda.io/questions/4945907/nskeyedunarchiver-unarchiveobjectwithdata-not-working.html

Ask one well-formed question or observation about the app, technologies used, or related topics.
Still trying to understand why we have that issue with textview where saving the todo item description in a textview will update all items in the array vs a text field doesnt have that issue.  I do understand why the fields in TodoItem should be declared using "copy", just the part that why text field has no issue with properties that are not declared as "copy", but textView has.
