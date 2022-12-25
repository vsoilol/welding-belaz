﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo
{
    /// <summary>
    /// Изделие
    /// </summary>
    public class Product : Entity
    {
        public string Name { get; set; }
        
        public int Number { get; set; }
        
        public Guid? WeldingTaskId { get; set; }
        
        [ForeignKey(nameof(WeldingTaskId))]
        public WeldingTask? WeldingTask { get; set; }
    }
}