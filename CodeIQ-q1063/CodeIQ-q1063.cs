using System;
using System.Threading.Tasks;

class Param
{
    public Param()
    {
        this.counter = 0;
    }
    public int counter { get; set; }
}
class Async
{
    private Param c;
    public string name;
    public Async(string name, Param c)
    {
        this.name = name;
        this.c = c;
    }
    public Param methodA()
    {
        for (int i = 0; i < 100000; i++)
        {
            c.counter++;
        }
        Console.WriteLine(this.name + " 集計完了！ 現時点の集計結果=" + c.counter);
        return c;
    }
    public Param methodB()
    {
        lock (c)
        {
            for (int i = 0; i < 100000; i++)
            {
                c.counter++;
            }
            Console.WriteLine(this.name + " 集計完了！ 現時点の集計結果=" + c.counter);
        }
        return c;
    }
    public Param methodC()
    {            
        for (int i = 0; i < 100000; i++)
        {
            lock (c)
            {
                c.counter++;
            }
        }
        Console.WriteLine(this.name + " 集計完了！ 現時点の集計結果=" + c.counter);
        return c;
    }
    public Param methodD(Task<Param> prev)
    {
        for (int i = 0; i < 100000; i++)
        {
            c.counter++;
        }
        Console.WriteLine(this.name + " 集計完了！ 現時点の集計結果=" + c.counter);
        return c;
    }
}

namespace Ten_Tame_q1063
{
	class Program
	{
		public static void Main(string[] args)
		{
			Param c;
			Async async1;
			Async async2;
			Task<Param> taskA;
			Task<Param> taskB;
			
			c = new Param();
			async1 = new Async("ヤスコ", c);
			async2 = new Async("ケイコ", c);
			
			// prpblem 1
//			taskA = new Task<Param>(async1.methodB);
//			taskB = new Task<Param>(async2.methodB);
//			taskA.Start();
//			taskB.Start();
			
			// prpblem 2
//			taskA = new Task<Param>(async1.methodB);
//			taskB = new Task<Param>(async2.methodA);
//			taskA.Start();
//			taskB.Start();
			
			// problem 3
//			taskA = new Task<Param>(async1.methodC);
//			taskB = new Task<Param>(async2.methodC);
//			taskA.Start();
//			taskB.Start();
			
			// problem 4
//			taskA = new Task<Param>(async1.methodA);
//			taskB = taskA.ContinueWith<Param>(async2.methodD);
//			taskA.Start();

			Task.WaitAll(taskA, taskB);
			Console.WriteLine("集計結果=" + c.counter);
			taskA.Dispose();
			taskB.Dispose();
			Console.WriteLine("");
			
			Console.Write("Press any key to continue . . . ");
			Console.ReadKey(true);
		}
	}
}