using { com.nikil.nani as db } from '../db/schema';

service nani {
    entity Product          as
        projection on db.Product {
            @UI.Hidden: true
            ID,
            *
        };
}

// annotate nani.Product with @odata.draft.enabled;

annotate nani.Product with {
    product_img @assert.match: '^https?:\/\/.*\.(?:png|jpg|jpeg)$';
};

annotate nani.Product with {
// @Common.Text : ' {Product}'
// @Core.IsURL: true
// @Core.MediaType: 'image/jpg'
product_img;
};

annotate nani.Product with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label:'ProductID',
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        {
            $Type : 'UI.DataField',
            Value : product_img
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost
        },
        {
            $Type : 'UI.DataField',
            Value : product_sell
        }
    ],  
);
annotate nani.Product with @(       
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            
            Value : product_id
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        {
            $Type : 'UI.DataField',
            Value : product_img
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost
        },
        {
            $Type : 'UI.DataField',
            Value : product_sell
        }
        
        ],
    },


    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductInfoFacet',
            Label : 'Product Information',
            Target : '@UI.FieldGroup#ProductInformation',
        },
    ],    
);