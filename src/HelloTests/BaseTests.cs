using System;
using Xunit;

namespace HelloTests
{
    public class BaseTests
    {
        [Fact]
        public void ThisIsAGreenTest()
        {

        }

        [Fact(Skip ="Skip this fail for now")]
        public void ThisIsARedTest()
        {
            Assert.False(true, "Failed test message");
        }
    }
}
