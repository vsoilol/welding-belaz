using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Responses
{
    public class WelderWithEquipmentResponseByte
    {
        [JsonPropertyName("EplID")]
        public Guid WelderId { get; set; }

        [JsonPropertyName("FirstN")]
        public byte[] FirstName { get; set; } = null!;

        [JsonPropertyName("LastN")]
        public byte[] LastName { get; set; } = null!;

        [JsonPropertyName("SecN")]
        public byte[] MiddleName { get; set; } = null!;

        [JsonPropertyName("Pos")]
        public byte[]? Position { get; set; }

        /// <summary>
        /// Табельный номер
        /// </summary>
        [JsonPropertyName("PersN")]
        public string? ServiceNumber { get; set; }

        [JsonPropertyName("EqpID")]
        public Guid EquipmentId { get; set; }

        [JsonPropertyName("EqpT")]
        public byte[] EquipmentName { get; set; } = null!;

        /// <summary>
        /// Маркировка
        /// </summary>
        [JsonPropertyName("EqpM")]
        public string EquipmentMarking { get; set; } = null!;

        /// <summary>
        /// Заводской (инвентарный) номер
        /// </summary>
        [JsonPropertyName("InvN")]
        public string EquipmentFactoryNumber { get; set; } = null!;

        [JsonPropertyName("WSID")]
        public Guid WorkshopId { get; set; }

        [JsonPropertyName("WST")]
        public byte[] WorkshopName { get; set; } = null!;

        [JsonPropertyName("WSN")]
        public int WorkshopNumber { get; set; }

        [JsonPropertyName("ProdArID")]
        public Guid ProductionAreaId { get; set; }

        [JsonPropertyName("ProdArT")]
        public byte[] ProductionAreaName { get; set; } = null!;

        [JsonPropertyName("ProdArN")]
        public int ProductionAreaNumber { get; set; }

        [JsonPropertyName("PostID")]
        public Guid? PostId { get; set; }

        [JsonPropertyName("PostN")]
        public int? PostNumber { get; set; }

        [JsonPropertyName("WorkPlID")]
        public Guid? WorkplaceId { get; set; }

        [JsonPropertyName("WorkPlN")]
        public int? WorkplaceNumber { get; set; }
    }
}
