using System;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using Avalonia.Media;
using Avalonia.Platform;
using Avalonia.Rendering.SceneGraph;
using Avalonia.Threading;

namespace AvaloniaAotBench
{
    public partial class MainWindow : Window
    {
        private bool _rendered;
        public MainWindow()
        {
            InitializeComponent();
#if DEBUG
            this.AttachDevTools();
#endif
        }

        private void InitializeComponent()
        {
            AvaloniaXamlLoader.Load(this);
        }

        class BenchOp : ICustomDrawOperation
        {
            public BenchOp(Rect bounds)
            {
                Bounds = bounds;
            }

            public void Dispose()
            {
                
            }

            public bool HitTest(Point p) => false;

            public void Render(IDrawingContextImpl context)
            {
                Console.WriteLine("Time from Main to first render: " + (Program.Stopwatch.Elapsed - Program.MainTime));
            }

            public Rect Bounds { get; }
            public bool Equals(ICustomDrawOperation? other)
            {
                return false;
            }
        }
        
        public override void Render(DrawingContext context)
        {
            if (!_rendered)
            {
                context.Custom(new BenchOp(Bounds));
                _rendered = true;
                Dispatcher.UIThread.Post(InvalidateVisual);
            }

            base.Render(context);
        }
    }
}