const PDFDocument = require("pdfkit-table");;
async function buildPDF(dataCallback, endCallback, data) {
    const doc = new PDFDocument({ bufferPages: true, font: 'Courier' });

    const imageWidth = 200;
    const pageWidth = (doc.page.width - imageWidth) / 2;
    const pageHeight = doc.page.height;

    doc.on('data', dataCallback);
    doc.on('end', endCallback);

    doc
        .image('src/public/style-1/img/logo_p.png', pageWidth, 15, { fit: [imageWidth, imageWidth] })


    const table = {
        title: "Presupuesto",
        subtitle: "Detalles",
        headers: ["", "", "", ""],
        rows: [
            ["Nombre", "12%", "Rut", "fg"],
            ["Dirección", "67%", "Fono", "gf"],
            ["Siniestro", "33%", "Fecha Ppto", "gf"],
            ["Email", "33%", "Nro.Ppto", "gf"],

        ],
    };
    // A4 595.28 x 841.89 (portrait) (about width sizes)
   /* await doc.text(`Nombre: ${data[0].client_name} ${data[0].client_lastname}\n
                Dirección: ${data[0].client_address}\n
                Siniestro: ${data[0].incident_code}\n
                E-mail: ${data[0].client_email}\n`, {
        columns: 1,
        columnGap: 10,
        height: doc.page.height,

        align: 'left',
        indent: 40,     // Indentar el texto para mejorar la claridad visual
        paragraphGap: 10, // Espacio entre párrafos
        lineGap: 4      // Espacio entre líneas
    });*/

    // Datos de ejemplo para la lista
    const dataList = [
        `Nombre: ${data[0].client_name} ${data[0].client_lastname}`, `Dirección: ${data[0].client_address}`, `Siniestro: ${data[0].incident_code}`, `E-mail: ${data[0].client_email}`,
        `Rut: ${data[0].client_rut}`, `Fono: ${data[0].client_phone}`, `Fecha Ppto:fech`, `Numero Ppto:Num`
    ];

    // Configuración de las columnas
    const columnWidth = 250;
    const columnSpacing = 10;
    const leftColumnX = 72;
    const rightColumnX = leftColumnX + columnWidth + columnSpacing;
    const startY = 120;
    const lineGap = 20;

    // Función para agregar datos a una columna
    function addItemsToColumn(items, startX, startY) {
        for (let i = 0; i < items.length; i++) {
            doc.text(items[i], startX, startY + i * lineGap, {
                align: 'left',
                width: columnWidth,
            });
        }
    }

    // Dividir los datos en dos columnas
    const itemsPerColumn = Math.ceil(dataList.length / 2);
    const leftColumnItems = dataList.slice(0, itemsPerColumn);
    const rightColumnItems = dataList.slice(itemsPerColumn);

    // Agregar datos a cada columna
    addItemsToColumn(leftColumnItems, leftColumnX, startY);
    addItemsToColumn(rightColumnItems, rightColumnX, startY);

    // Finalizar el documento
    // width

    // or columnsSize
    //await doc.table(table, { 
    //  columnsSize: [ 200, 100, 100,100 ],
    //});

    doc.end();
}


function drawTable(data, startX, startY, columnWidths) {
    const lineHeight = 20;

    data.forEach((row, rowIndex) => {
        row.forEach((cell, cellIndex) => {
            doc
                .fontSize(12)
                .text(cell, startX + columnWidths[cellIndex], startY + rowIndex * lineHeight, {
                    width: columnWidths[cellIndex],
                    align: 'left',
                    valign: 'top'
                });
        });
    });
}

module.exports = { buildPDF };