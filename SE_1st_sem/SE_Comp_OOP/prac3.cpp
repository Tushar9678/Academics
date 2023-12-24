#include<iostream>
using namespace std;

class publishing
{
	private:string title;
		float price;
	public:
 		void add()
 		{
			  cout<<"\nEnter The Name Of Book:- ";
			  cin>>title;
			  cout<<"\nEnter The Price Of Book:- ";
			  cin>>price;
 		}      
		void display()
 		{
			  cout<<"\nThe Name Of Book is:  "<<title<<endl;
			  cout<<"\nThe Price Of Book is: "<<price<<endl;
	  
 		}	
};
class book:public publishing
{    private:int page_count;
 	public:

		void add()
		{
			cout<<"Enter the page count";
			cin>>page_count;
			try
			{
	
				if(page_count<=0)
				{
					throw page_count;
  	
				}
			}
				catch(...)
				{
					cout<<"!!!!!!!!!!!!!!Error Invalid Page Count!!!!!!!!!!!!!!!!!!";
					page_count=0; 
	 
	            }
		}
		void display()
		{
			cout<<"No. of page in book is : "<<page_count<<endl;
		}

};


class book2:public publishing
{
 	private:int audio_tape;
 	public:

		void add()
		{
			cout<<"Enter the audio count";
			cin>>audio_tape;
			try
			{
			
	
				if(audio_tape<=0)
				{
					throw audio_tape;
  	
				}
			}
				catch(...)
				{
					cout<<"!!!!!!!!!!!!!!Error Invalid Audio Tape!!!!!!!!!!!!!!!!!!!!!!!!!!!!!";
					audio_tape=0; 
  
				}
		}
	
		void display()
		{
			cout<<"No. of audio in book is : "<<audio_tape<<endl;
		}	
};
int main()
{
	publishing p1;
	book b1;
	book2 b2;
	int ch;
	int i=0;
	do
	{
	
		cout<<"\t1.Enter the book entry : "<<endl;
		cout<<"\t2.Enter the page no : "<<endl;
		cout<<"\t3.Enter the audio time : "<<endl;
		cout<<"\t4.Display Book Details : "<<endl;
		cout<<"\t5.Exit : "<<endl;
		cout<<"\n Enter your choice :"<<endl;
		
		
			cin>>ch;
	
	
			switch(ch)
			{
				case 1: p1.publishing::add();
					break;
				case 2: b1.book::add();
					break;
				case 3: b2.book2::add();
					break;
				case 4: p1.publishing::display();
					b1.book::display();
					b2.book2::display();
					break;
				default: cout<<"!!!!!!WRONG CHOICE ENTERED!!!!!!";
			}
		}while(ch!=5);	 
	return 0;
}









