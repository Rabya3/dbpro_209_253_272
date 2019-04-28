using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EatryOnline.Startup))]
namespace EatryOnline
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
