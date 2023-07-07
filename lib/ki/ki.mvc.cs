using System;

namespace ki.mvc
{
  public class ReportClass
  {

  public Action<string> Debug;
  public Action<string> Warning;
  public Action<string> Error;
  public Action<string> Failure;

  }
}
