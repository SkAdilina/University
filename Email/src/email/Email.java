
package email;


import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.lang.*;
import javax.swing.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Email implements ActionListener,WindowListener{

	private Frame f;
	private Button b1;
	private TextField t1;
	private MenuBar mb;
	private Menu m1;
	private MenuItem mi1;
	private Panel p1;
	private String s;
        private String in;
        private String[] spam=new String[100];
        private String[] ham=new String[100];
        private int[] cspam=new int[100];
        private int[] cham=new int[100];
        public int spamw=0,hamw=0,i,j,count,d,flag,spamwtotal,hamwtotal,totalunique=0,spamline=0,hamline=0,totalline,p;
        public double p_spam,p_ham,probspam=1,probham=1,prob;
	
	public Email(){
	
		f=new Frame("Menu Frame");

		p1=new Panel();
		
		mb=new MenuBar();
		
		m1=new Menu("File");
		mi1=new MenuItem("Exit");
		mi1.addActionListener(this);
		mi1.getActionCommand();
		
		b1=new Button(" Spam or not? ");
		b1.addActionListener(this);
		b1.setActionCommand("b1");
		b1.setBackground(Color.pink);
		
		t1=new TextField(30);
		
	}
	
	public void launch(){
	
		f.setLayout(new GridLayout(2,1));
		p1.setBackground(Color.cyan);
		p1.add(t1);
		p1.add(b1);

		m1.add(mi1);
		mb.add(m1);
		f.setMenuBar(mb);
		f.add(p1);
		
		f.setBackground(Color.cyan);
		f.addWindowListener(this);
		f.setVisible(true);
		f.setSize(300,200);
		
	}
	

	public void actionPerformed(ActionEvent e){
		spamw=0;
                hamw=0;
		if(e.getSource()==mi1){
			System.exit(0);
		}
		
		try{
                    if(e.getActionCommand()=="b1"){
                        
        		
			File f=new File("Spam.txt");
                        FileReader fr=new FileReader(f);
			BufferedReader in =new BufferedReader(fr);
                        s=null;
			s=in.readLine();
                        count=0;
                        for (j=0; j<100 ; j++) {
                            cspam[j]=0;
                            cham[j]=0;                
                        }
			while(s!=null){
                            spamline++;
                                    
                            for (i=0,d=0; i!=s.length() ; i++) {
                                char c = s.charAt(i);
                                if(d==0)
                                {
                                    spam[count]=""+c;
                                    d=1;
                                }
                                else
                                {
                                    if(c!=' ')
                                        spam[count]+=c;
                                }
				if(c==' ')
                                {
                                                    //System.out.println(spam[count]);
                                    flag=0;
                                    for (j=0; j<count ; j++) {
                                                      
                                 	if(spam[j].matches(spam[count]))
                                        {
                                            flag=1;
                                            cspam[j]+=1;
                                        }
                                                    
                                    }
                                    spamw++;
                                    if(flag==0)
                                    {
                                        count++;
                                        cspam[count-1]+=1;
                                    }
                                    d=0;                            
                                }
                            }     
                            flag=0;
                            for (j=0; j<count ; j++) {
                                if(spam[j].matches(spam[count]))
                                {
                                    flag=1;
                                    cspam[j]+=1;
                                }
                            }
                            
                            spamw++;
                            if(flag==0)
                            {
                                count++;
                                cspam[count-1]+=1;
                            }
                            d=0;   
                            s=in.readLine();
			}
                        for (j=0; j<count ; j++) {
                            System.out.println(spam[j] + ' ' + cspam[j]);
                        }
                        spamwtotal=count;
                        //System.out.println(spamw);
                        in.close();
			
                        f=new File("Not Spam.txt");
                        fr=new FileReader(f);
			in =new BufferedReader(fr);
                        s=null;
			s=in.readLine();
                        count=0;
			while(s!=null){
                            hamline++;
                                    //t2.setText(s);
                            for (i=0,d=0; i!=s.length() ; i++) {
                                char c = s.charAt(i);
                                if(d==0)
                                {
                                    ham[count]=""+c;
                                    d=1;
                                }
                                else
                                {
                                    if(c!=' ')
                                        ham[count]+=c;
                                }
				if(c==' ')
                                {
                                                    //System.out.println(spam[count]);
                                    flag=0;
                                    for (j=0; j<count ; j++) {
                                        //System.out.println(ham[j]+" "+ham[count]);              
                                 	if(ham[j].matches(ham[count]))
                                        {
                                            flag=1;
                                            cham[j]+=1;
                                            break;
                                        }
                                        
                                                    
                                    }
                                    hamw++;
                                    //System.out.println("   "+flag);
                                    if(flag==0)
                                    {
                                        count++;
                                        cham[count-1]+=1;
                                    }
                                    d=0;                            
                                }
                            }     
                            flag=0;
                            for (j=0; j<count ; j++) {
                                //System.out.println(ham[j]+" "+ham[count]);
                                if(ham[j].matches(ham[count]))
                                {
                                    flag=1;
                                    cham[j]+=1;
                                    break;
                                }
                                
                            }
                            //System.out.println("   "+flag);
                            hamw++;
                            if(flag==0)
                            {
                                count++;
                                cham[count-1]+=1;
                            }
                            d=0;   
                            s=in.readLine();
			}
                        for (j=0; j<count ; j++) {
                            //System.out.println(ham[j] + ' ' + cham[j]);
                        }
                        hamwtotal=count;
                        //System.out.println(hamw);
                        in.close();
			}
                    totalunique=0;
                    
                    for (j=0; j<hamwtotal ; j++) {
                        flag=0;
                        for (i=0; i<spamwtotal ; i++) {
                            //System.out.println(ham[j]+" "+spam[i]);
                            if(ham[j].matches(spam[i]))
                            {
                                flag=1;
                                break;
                            }
                        }  
                        if(flag==0)
                            totalunique+=1;
                        //System.out.println(" "+totalunique);
                            
                    }
                    totalunique+=spamwtotal;
                    //System.out.println("total unique : "+totalunique);
                    //System.out.println(hamline +" "+spamline);
                    totalline=hamline+spamline;
                    p_spam=(spamline*1.0)/(totalline*1.0);
                    p_ham=(hamline*1.0)/(totalline*1.0);
                    //System.out.println(p_ham +" "+p_spam);
                    probspam=p_spam;
                    probham=p_ham;
                    s=t1.getText();
                    //System.out.println(s);
                    
                    for (i=0,d=0; i!=s.length() ; i++) {
                        char c = s.charAt(i);
                        if(d==0)
                        {
                            in=""+c;
                            d=1;
                        }
                        else
                            in+=c;
                        if(c==' ')
                        {
                            d=0;
                            p=0;
                            System.out.println(in);
                            for (j=0; j<hamwtotal ; j++) {
                                if(ham[j].matches(in))
                                    {
                                        p=cham[j];
                                        break;
                                    }
                                } 
                            prob=(p+1*1.0)/(totalunique+hamw);
                            probham*=prob;
                            for (j=0; j<spamwtotal ; j++) {
                                if(spam[j].matches(in))
                                    {
                                        p=cspam[j];
                                        break;
                                    }
                                } 
                            prob=(p+1*1.0)/(totalunique+spamw);
                            probspam*=prob;
                            //System.out.println(prob);
                        }
                    }
                    System.out.println(in);
                    for (j=0,p=0; j<hamwtotal ; j++) {
                        if(ham[j].matches(in))
                        {
                            //System.out.println("click found in ham");
                            p=cham[j];
                            break;
                        }
                    } 
                    System.out.println(p);
                    System.out.println(totalunique);
                    System.out.println(hamw);
                    prob=(p+1*1.0)/(totalunique+hamw);
                    probham*=prob;
                    //System.out.println(prob);
                    for (j=0,p=0; j<spamwtotal ; j++) {
                        System.out.println(spam[j] + ' ' + in);
                        if(spam[j].matches(in))
                        {
                            //System.out.println("click found in spam");
                            p=cspam[j];
                            break;
                        }
                    } 
                    System.out.println(p);
                    System.out.println(totalunique);
                    System.out.println(spamw);
                    prob=(p+1*1.0)/(totalunique+spamw);
                    probspam*=prob;
			System.out.println("spam "+probspam+"  ham"+probham);
                    if(probspam>=probham)
                        JOptionPane.showMessageDialog(null,"SPAM!!!");
                    else
                        JOptionPane.showMessageDialog(null,"NOT SPAM");
                    }
                    //in has the last word here
                    
                
		catch(Exception e2){}
	}
	
	public void windowClosing(WindowEvent e){
		System.exit(0);
	}
	
	public void windowOpened(WindowEvent e){}
	public void windowIconified(WindowEvent e){}
	public void windowDeiconified(WindowEvent e){}
	public void windowClosed(WindowEvent e){}
	public void windowActivated(WindowEvent e){}
	public void windowDeactivated(WindowEvent e){}

	public static void main(String[] args){
		Email fexam=new Email();
		fexam.launch();
	}
}
            