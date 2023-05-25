using Belaz.WeldingApp.Common.Entities.Production;

namespace Belaz.WeldingApp.WeldingApi.Tests.DataFactories;

public static class PostFactory
{
    public static List<Post> GetPostList()
    {
        var posts = new List<Post>
        {
            new()
            {
                Id = Guid.NewGuid(),
                Number = 1,
                Name = "Пост 1",
                ProductionArea = new ProductionArea
                {
                    Id = Guid.NewGuid(),
                    Number = 1,
                    Name = "Производственный участок 1",
                    Workshop = new Workshop
                    {
                        Id = Guid.NewGuid(),
                        Number = 1,
                        Name = "Цех 1",
                    }
                }
            },
            new()
            {
                Id = Guid.NewGuid(),
                Number = 2,
                Name = "Пост 2",
                ProductionArea = new ProductionArea
                {
                    Id = Guid.NewGuid(),
                    Number = 2,
                    Name = "Производственный участок 2",
                    Workshop = new Workshop
                    {
                        Id = Guid.NewGuid(),
                        Number = 2,
                        Name = "Цех 2",
                    }
                }
            },
            new()
            {
                Id = Guid.NewGuid(),
                Number = 3,
                Name = "Пост 3",
                ProductionArea = new ProductionArea
                {
                    Id = Guid.NewGuid(),
                    Number = 3,
                    Name = "Производственный участок 3",
                    Workshop = new Workshop
                    {
                        Id = Guid.NewGuid(),
                        Number = 3,
                        Name = "Цех 3",
                    }
                }
            }
        };

        return posts;
    }
}