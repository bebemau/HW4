# HW4

How was your experience making this app?
Good exercise.  It wasnt obvious from the writeup about a detail text field at the bottom right.  Didnt realize until a classmate mentioned about having two text fields.  Tried to use a text view for the detail field but was having trouble saving to the right item in the array, replacing the textview with a text field using exactly the same code fixed the problem.  Still dont understand what was wrong but have spent way too many hours and still couldnt make sense of the behavior so gave up.

What resources did you find helpful?
http://stackoverflow.com/questions/2455161/unrecognized-selector-sent-to-instance
http://stackoverflow.com/questions/20927451/get-indexpath-row-from-tableview-objective-c
http://www.wenda.io/questions/4945907/nskeyedunarchiver-unarchiveobjectwithdata-not-working.html

Ask one well-formed question or observation about the app, technologies used, or related topics.
1.  Delegates: what if you have two of the same controls and you only want one to use the delegates?  How to specify only one of the controls should trigger the delegate?
2.  When declaring textview this is the property added to the viewController.h file: @property (unsafe_unretained) IBOutlet NSTextView *txtTodoItemDetail;  what does unsafe_unretained mean, can I just change that to weak like other controls?
3.  when saving textview's string property to a variable, in debug mode the value is always class= NSBigMutableString.  The only way i could get to see the actual value is to do NSLog.  Maybe I did something wrong, is there any way to easily inspect the value in the object inspector window?
