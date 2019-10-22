import 'package:flutter/material.dart';

import '../main.dart';
import 'ShowCategoryProducts.dart';

var spicesSubCategories = [
  {
    'categoryName': 'WHOLE SPICES',
    'categoryImage': 'images/categories/whole-spices-herbs-2.png'
  },
  {
    'categoryName': 'POWDERED SPICES',
    'categoryImage': 'images/categories/powdered-spices-herbs.jpg'
  },
  {
    'categoryName': 'BLENDED SPICES',
    'categoryImage': 'images/categories/mixed-spices.jpg'
  },
  {
    'categoryName': 'DRY FRUITS & NUTS',
    'categoryImage': 'images/categories/dry-fruits-nuts.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fdry-fruits-nuts.jpg?alt=media&token=80ead6b9-5c87-47b3-a180-9215935928df'
  },
  {
    'categoryName': 'COOKING PASTES',
    'categoryImage': 'images/categories/cooking-paste.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fcooking-paste.jpg?alt=media&token=9162758d-0136-40be-8fe9-657136388b1d'
  },
  {
    'categoryName': 'BAKING',
    'categoryImage': 'images/categories/baking.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbaking.jpg?alt=media&token=49fbe53d-a764-4684-9a2e-5f69cb1cba20'
  },
];

var edibleOilsSubCategories = [
  {
    'categoryName': 'SUNFLOWER OILS',
    'categoryImage': 'images/categories/sunflower-oil.jpg'
  },
  {
    'categoryName': 'VEGETABLE OILS',
    'categoryImage': 'images/categories/vegetable-oil.png'
  },
  {
    'categoryName': 'GROUNDNUT OILS',
    'categoryImage': 'images/categories/groundnut-oil.jpg'
  },
  {
    'categoryName': 'RICEBRAN OILS',
    'categoryImage': 'images/categories/ricebran-oil.jpg'
  },
  {
    'categoryName': 'OLIVE OILS',
    'categoryImage': 'images/categories/olive-oil.jpg'
  },
  {
    'categoryName': 'SESAME OILS',
    'categoryImage': 'images/categories/gingelly-oil.jpg'
  },
  {
    'categoryName': 'PALM OILS',
    'categoryImage': 'images/categories/palm-oil.jpg'
  },
  {
    'categoryName': 'COW GHEE',
    'categoryImage': 'images/categories/desi-cow.png'
  },
  {
    'categoryName': 'BUFFALO GHEE',
    'categoryImage': 'images/categories/desi-buffalo.jpg'
  },
  {
    'categoryName': 'VANASPATI',
    'categoryImage': 'images/categories/vanaspati.jpg'
  },
];

var picklesChutneyPowderSubCategories = [{
    'categoryName': 'PICKLES',
    'categoryImage': 'images/categories/pickles-chutneys.jpg',
  },
  {
    'categoryName': 'CHUTNEY POWDERS',
    'categoryImage': 'images/categories/chutney-powder.jpg'
  },
  ];

var instantFoodSubCategories = [
  {
    'categoryName': 'INSTANT NOODLES',
    'categoryImage': 'images/categories/instant-noodles.jpg'
  },
  {
    'categoryName': 'INSTANT PASTA',
    'categoryImage': 'images/categories/instant-pasta.jpg'
  },
  {
    'categoryName': 'INSTANT BREAKFAST',
    'categoryImage': 'images/categories/instant-breakfast.jpg'
  },
  {
    'categoryName': 'INSTANT MEALS',
    'categoryImage': 'images/categories/instant-meals.jpeg'
  },
  {
    'categoryName': 'INSTANT SWEET MIX',
    'categoryImage': 'images/categories/instant-sweet-mix.jpg'
  }
];

var kiranaSubCategories = [
  {
    'categoryName': 'ATTA',
    'categoryImage': 'images/categories/flours.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fflours.png?alt=media&token=f5b74cb2-9638-49a7-957d-c90f500c0429'
  },
  {
    'categoryName': 'RAVA',
    'categoryImage': 'images/categories/atta-rava.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fatta-rava.jpg?alt=media&token=74146ec2-bf67-486c-a817-bbe117f817c1'
  },
  {
    'categoryName': 'RICE',
    'categoryImage': 'images/categories/rice-4.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Frice-2.jpg?alt=media&token=b017e46b-4357-4bc7-a954-d07c2a3ace51'
  },
  {
    'categoryName': 'DALS',
    'categoryImage': 'images/categories/pulses-cereals-2.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fpulses-cereals-2.jpg?alt=media&token=38c05b59-4536-4867-bdc2-00eb6fe30f95'
  },
  // {
  //   'categoryName': 'SPICES',
  //   'categoryImage': 'images/categories/whole-spices-herbs-2.png'
  //   // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fwhole-spices-herbs-2.png?alt=media&token=ac9bd972-8c9b-4a25-b2d3-3ef7f252a4ec'
  // },

  // {
  //   'categoryName': 'EDIBLE OILS',
  //   'categoryImage': 'images/categories/cooking-oils.jpg'
  //   // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fcooking-oils.jpg?alt=media&token=5f372f52-0554-4b07-94a6-0532a03dac6d'
  // },
  // {
  //   'categoryName': 'TEA&COFFEE',
  //   'categoryImage': 'images/categories/tea-coffee-mixes.jpg'
  //   // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ftea-coffee-mixes.jpg?alt=media&token=a5972b4d-3516-4fe4-bc54-228526f15ba4'
  // },
  {
    'categoryName': 'HEALTH PRODUCTS',
    'categoryImage': 'images/categories/malt-drinks.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fmalt-drinks.jpg?alt=media&token=77de014c-0062-4db0-8ed6-80930e7a2ae5'
  },
  {
    'categoryName': 'SAUCES',
    'categoryImage': 'images/categories/sauce.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fjams-sauces-ketchups-2.jpeg?alt=media&token=eac768de-f5d2-4eb3-b1ae-683e24023a7d'
  },
    {
    'categoryName': 'KETCHUPS',
    'categoryImage': 'images/categories/ketchup.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fjams-sauces-ketchups-2.jpeg?alt=media&token=eac768de-f5d2-4eb3-b1ae-683e24023a7d'
  },
  {
    'categoryName': 'VINEGARS',
    'categoryImage': 'images/categories/vinegar.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fjams-sauces-ketchups-2.jpeg?alt=media&token=eac768de-f5d2-4eb3-b1ae-683e24023a7d'
  },
  // {
  //   'categoryName': 'PICKLES&CHUTNEYS',
  //   'categoryImage': 'images/categories/pickles-chutneys.jpg'
  //   // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fpickles-chutneys.jpg?alt=media&token=37cdd4ee-c8ba-44b5-a91d-de4b7078d5ea'
  // },
  {
    'categoryName': 'NOODLES & VERMICELLI',
    'categoryImage': 'images/categories/vermicelli.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fvermicelli.jpg?alt=media&token=a232f5cb-7488-4211-b0af-9e9153023b89'
  },
  // {
  //   'categoryName': 'INSTANT FOOD',
  //   'categoryImage': 'images/categories/noodles.jpg'
  //   // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fnoodles.jpg?alt=media&token=d9ded415-9b99-4327-ab5f-64ac5c40bf74'
  // },
];

var greenzSubCategories = [
  {
    'categoryName': 'LEAFY VEG',
    'categoryImage': 'images/categories/leafy-veg.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fleafy-veg.jpg?alt=media&token=3debf7e2-4ee7-400d-a1b5-b2bd193c7a6e'
  },
  {
    'categoryName': 'NON-LEAFY VEG',
    'categoryImage': 'images/categories/non-leafy.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fnon-leafy.jpg?alt=media&token=a0493fc1-1aeb-45c1-bb5e-392f3a86ebaa'
  },
  {
    'categoryName': 'FRUITS',
    'categoryImage': 'images/categories/fruits.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ffruits.png?alt=media&token=e71e0ac8-11ed-43c8-873d-41db8cf94205'
  },
  {
    'categoryName': 'FROZEN VEG',
    'categoryImage': 'images/categories/frozen-veg.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ffrozen-veg.jpg?alt=media&token=0d8b2b2f-7674-4b09-a892-f32b60e8eba0'
  },
];

var dairySubCategories = [
  {
    'categoryName': 'MILK',
    'categoryImage': 'images/categories/milk.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fmilk.jpg?alt=media&token=e2cdd8cb-1599-49b8-8d37-4e1b74ca7af2'
  },
  {
    'categoryName': 'CURD',
    'categoryImage': 'images/categories/curd.jfif'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fcurd.jfif?alt=media&token=09a7df24-b3be-40f0-9060-09131ea7fc26'
  },
  {
    'categoryName': 'PANEER',
    'categoryImage': 'images/categories/paneer.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fpaneer.jpg?alt=media&token=e401cfb7-d0a5-4a3b-bea5-d0b4756e74b2'
  },
  {
    'categoryName': 'EGGS',
    'categoryImage': 'images/categories/eggs.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Feggs.jpg?alt=media&token=c3676afb-e8ad-41ec-b72a-cf0e71e70d9e'
  },
  {
    'categoryName': 'BUTTER',
    'categoryImage': 'images/categories/butter.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbutter.jpg?alt=media&token=68d9b9b0-29f5-455e-88c9-c453981db172'
  },
  {
    'categoryName': 'CHEESE',
    'categoryImage': 'images/categories/cheese.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fcheese.jpg?alt=media&token=328e112a-90f6-4d36-8dce-08cf55224a54'
  },
  {
    'categoryName': 'FRESH CREAM',
    'categoryImage': 'images/categories/fresh-cream.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ffresh-cream.jpg?alt=media&token=004e1a58-73f0-4e2a-b4fd-a434952b69a0'
  }
];

var snacksSubCategories = [
  {
    'categoryName': 'CHIPS',
    'categoryImage': 'images/categories/chips.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fchips.jpg?alt=media&token=4aa62939-bb05-4645-9360-b0c9c29c557f'
  },
  {
    'categoryName': 'NAMKEENS',
    'categoryImage': 'images/categories/namkeen.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fnamkeen.png?alt=media&token=2ffbc09a-35e3-4f8d-abc1-2ab63d069e8b'
  },
  {
    'categoryName': 'POPCORN',
    'categoryImage': 'images/categories/popcorn.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fpopcorn.jpg?alt=media&token=646a3924-4f47-4a68-9799-80d3a8e185d3'
  },
  {
    'categoryName': 'SWEETS',
    'categoryImage': 'images/categories/sweets.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fsweets.jpg?alt=media&token=fa3415b4-d91f-4cc6-9a57-e1ffba647113'
  },
  {
    'categoryName': 'BISCUITS',
    'categoryImage': 'images/categories/biscuits.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbiscuits.jpg?alt=media&token=a7ebcb49-b53a-4b23-8802-83a549b43c43'
  },
  {
    'categoryName': 'CHOCOLATES',
    'categoryImage': 'images/categories/chocolates.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fchocolates.jpg?alt=media&token=f93ed1ad-0156-4e98-8c73-069baa2cd07b'
  },
  {
    'categoryName': 'CAKES',
    'categoryImage': 'images/categories/cake.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fcake.png?alt=media&token=2e5fc162-6467-4402-9845-80abe32cebb4'
  },
  {
    'categoryName': 'FROZEN SNACKS',
    'categoryImage': 'images/categories/frozen-snacks.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ffrozen-snacks.jpg?alt=media&token=7a635313-e49b-4bbe-82c5-600e5624c796'
  },
];

var hairCareSubCategories = [
  {
    'categoryName': 'HAIR OILS',
    'categoryImage': 'images/categories/hair-oil.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fhair-oil.jpg?alt=media&token=ca4c42df-9c3b-422c-b130-1932aa7f9d47'
  },
  {
    'categoryName': 'SHAMPOOS & CONDITIONERS',
    'categoryImage': 'images/categories/shampoo.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fshampoo.jpg?alt=media&token=7e273120-51ef-4bdc-9cb9-e587fd96ed7b'
  },
  {
    'categoryName': 'HAIR COLOR',
    'categoryImage': 'images/categories/hair-color.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fhair-color.jpg?alt=media&token=faf21767-54b3-4bd4-bd9f-340ba95c6b9c'
  },
  {
    'categoryName': 'HAIR CREAM',
    'categoryImage': 'images/categories/hair-gel.jpeg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fhair-gel.jpeg?alt=media&token=17795b44-e313-41de-850a-2d3af5d325ed'
  }
];

var feminineHygieneSubCategories = [
  {
    'categoryName': 'SANITARY PADS',
    'categoryImage': 'images/categories/sanitary-pads.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fchips.jpg?alt=media&token=4aa62939-bb05-4645-9360-b0c9c29c557f'
  },
  // {
  //   'categoryName': 'PANTYLINERS',
  //   'categoryImage':
  //   'images/categories/pantyliner.jfif'
  //       // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fnamkeen.png?alt=media&token=2ffbc09a-35e3-4f8d-abc1-2ab63d069e8b'
  // },
  {
    'categoryName': 'INTIMATE HYGIENE',
    'categoryImage': 'images/categories/intimate-hygiene.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fpopcorn.jpg?alt=media&token=646a3924-4f47-4a68-9799-80d3a8e185d3'
  }
];

var pestControlSubCategories = [
  {
    'categoryName': 'MOSQUITO&FLY CONTROL',
    'categoryImage': 'images/categories/pest-control.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fpest-control.jpg?alt=media&token=5d43a869-05b2-4248-b349-550784002333'
  },
  {
    'categoryName': 'RODENT CONTROL',
    'categoryImage': 'images/categories/rodent-control.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fpest-control.jpg?alt=media&token=5d43a869-05b2-4248-b349-550784002333'
  }
];

var shavingSubCategories = [
  {
    'categoryName': 'SHAVING CREAMS & FOAMS',
    'categoryImage': 'images/categories/shaving-cream-foam-2.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fshaving-cream-foam-2.jpg?alt=media&token=b24ccff0-2d69-46ff-82a3-1807c2021b12'
  },
  {
    'categoryName': 'SHAVING BLADES & RAZORS',
    'categoryImage': 'images/categories/shaving-razor.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fshaving-razor.jpg?alt=media&token=ff36ddfd-ef04-4b82-a859-a40c378c9f93'
  },
  {
    'categoryName': 'AFTER-SHAVE',
    'categoryImage': 'images/categories/after-shave.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fafter-shave.png?alt=media&token=e5f25da4-2e3b-4309-9256-94f87159369e'
  }
];

var deoSubCategories = [
  {
    'categoryName': 'DEODORANTS',
    'categoryImage': 'images/categories/deodorant.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fdeodorant.png?alt=media&token=16306864-2112-4ad5-badb-19ba61f71497'
  },
  {
    'categoryName': 'ROLL-ONS',
    'categoryImage': 'images/categories/roll-on.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Froll-on.png?alt=media&token=200f0806-1159-4e50-85d9-142fa2006838'
  },
  {
    'categoryName': 'PERFUMES',
    'categoryImage': 'images/categories/perfume.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fperfume.jpg?alt=media&token=40d11b98-0434-4bcf-b38c-fe84e7b9f8e2'
  },
  {
    'categoryName': 'TALCUM POWDERS',
    'categoryImage': 'images/categories/talcum-powder.jpeg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ftalcum-powder.jpeg?alt=media&token=e5e7ebad-76e7-4162-9aa2-da47149b2fb0'
  }
];

var breakfastSubCategories = [
  {
    'categoryName': 'BREAD',
    'categoryImage': 'images/categories/bread.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbread-383by267.png?alt=media&token=d63e4e27-b07a-4d02-8630-ec02de537b0d'
  },
  {
    'categoryName': 'BREAKFAST CEREALS&OATS',
    'categoryImage': 'images/categories/breakfast-cereals.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbreakfast-cereals.jpg?alt=media&token=f362ec04-e832-4556-8471-d2666b618273'
  },
  {
    'categoryName': 'SPREADS & SYRUPS',
    'categoryImage': 'images/categories/spread-syrup.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fspread-syrup.jpg?alt=media&token=a130f3fa-f85b-42e5-a0ed-30fea439832a'
  },
  {
    'categoryName': 'JAMS',
    'categoryImage': 'images/categories/jams-sauces-ketchups.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ffruit-jams.jpg?alt=media&token=18cd1472-0d9a-4717-bf4b-1a788093d152'
  },
  {
    'categoryName': 'HONEY',
    'categoryImage': 'images/categories/honey-banner.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fhoney-banner.jpg?alt=media&token=063b1f19-ed6e-4c90-928a-92371deab1f5'
  }
];

var fabricSubCategories = [
  {
    'categoryName': 'DETERGENT BARS',
    'categoryImage': 'images/categories/detergent-bars.jpeg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fdetergent-bars.jpeg?alt=media&token=6bc9c5da-5e41-42fb-8cf3-4ff168de9148'
  },
  {
    'categoryName': 'DETERGENT POWDERS',
    'categoryImage': 'images/categories/detergent-powders.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fdetergent-powders.jpg?alt=media&token=b3cd3ed7-c391-4481-8c9f-be814504264b'
  },
  {
    'categoryName': 'DETERGENT LIQUIDS',
    'categoryImage': 'images/categories/detergent-liquids.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fdetergent-liquids.jpg?alt=media&token=8736b45c-6425-4fd5-8ca8-5a6673b1b2d6'
  },
  {
    'categoryName': 'AFTER WASH',
    'categoryImage': 'images/categories/after-wash.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fafter-wash.jpg?alt=media&token=dfd153c0-e941-44da-892e-a1ebcec11f7c'
  },
  {
    'categoryName': 'FABRIC STAIN REMOVER',
    'categoryImage': 'images/categories/fabric-stain-remover.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ffabric-stain-remover.png?alt=media&token=c54b7a86-35aa-4735-8a1b-91e56ed44f39'
  }
];

var dishwashSubCategories = [
  {
    'categoryName': 'DISHWASH BARS',
    'categoryImage': 'images/categories/dish-wash-bar.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fdish-wash-bar.jpg?alt=media&token=71e3e49e-7d57-4a99-addd-ce06e6db9903'
  },
  {
    'categoryName': 'DISHWASH LIQUIDS',
    'categoryImage': 'images/categories/dish-wash-liquid.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fdish-wash-liquid.jpg?alt=media&token=2de2eabd-2061-4db0-b246-da460bf84bc0'
  },
  {
    'categoryName': 'DISHWASH SCRUBS',
    'categoryImage': 'images/categories/dish-wash-scrubber.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fdish-wash-scrubber.jpg?alt=media&token=ba6e212f-4e22-4fe1-897d-7b42d2cc8ccb'
  }
];

var homeSubCategories = [
  {
    'categoryName': 'BATHROOM CLEANERS',
    'categoryImage': 'images/categories/toilet-cleaner.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ftoilet-cleaner.jpg?alt=media&token=0ea03fed-7bcb-4c8e-b678-54153b4a84a8'
  },
  {
    'categoryName': 'FLOOR CLEANERS',
    'categoryImage': 'images/categories/floor-cleaner.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ffloor-cleaner.jpg?alt=media&token=69150c41-6442-4907-8459-f3a4ab768777'
  },
  {
    'categoryName': 'MULTI-SURFACE CLEANERS',
    'categoryImage': 'images/categories/multi-surface-cleaner.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fmulti-surface-cleaner.jpg?alt=media&token=b30587f4-0b9a-4ad0-9cbb-8b8e6ad71805'
  },
  {
    'categoryName': 'AIR FRESHENERS',
    'categoryImage': 'images/categories/air-freshener.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fair-freshener.png?alt=media&token=14441cd1-57fb-419c-8751-a449f35e102b'
  },
  {
    'categoryName': 'ANTISEPTIC LIQUIDS',
    'categoryImage': 'images/categories/antiseptic-liquids.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fantiseptic-liquids.jpg?alt=media&token=4267171c-4469-4e3a-b3d4-e9d9a6566202'
  }
];

var personalSubCategories = [
  {
    'categoryName': 'BATH SOAPS',
    'categoryImage': 'images/categories/bath-products.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbath-products.jpg?alt=media&token=3dd9fb21-051c-4166-84fd-a8bd19797d6b'
  },
  {
    'categoryName': 'BODY WASH',
    'categoryImage': 'images/categories/body-wash.jfif'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbody-wash.jfif?alt=media&token=5dbd3940-1c3e-4adc-a49b-89640e31ddf5'
  },
  {
    'categoryName': 'BATH POWDERS',
    'categoryImage': 'images/categories/bath-powder.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbath-powder.jpg?alt=media&token=a0569d03-20fb-4689-b9a8-96956d3b90c7'
  },
  {
    'categoryName': 'FACEWASH',
    'categoryImage': 'images/categories/face-wash.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fface-wash.jpg?alt=media&token=cb44ee18-9b4b-4bad-8f8d-a172fd4d1593'
  },
  {
    'categoryName': 'FACE CREAM',
    'categoryImage': 'images/categories/face-cream.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fface-cream.jpg?alt=media&token=1bf3124a-1755-4cb6-b57b-f6c3257c37d3'
  },
  {
    'categoryName': 'BODY LOTION',
    'categoryImage': 'images/categories/body-lotion.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbody-lotion.png?alt=media&token=189daffb-523b-4264-a962-d474aa943781'
  },
  {
    'categoryName': 'SUNSCREEN',
    'categoryImage': 'images/categories/sunscreen.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fsunscreen.jpg?alt=media&token=5a4d9004-17eb-4e83-aa7b-46872b3ac7c2'
  },
  {
    'categoryName': 'LIP BALM',
    'categoryImage': 'images/categories/lipbalm.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Flipbalm.jpg?alt=media&token=b56b809b-c9fa-4e40-90ae-4fd4145b02ba'
  },
  {
    'categoryName': 'MAKE-UP',
    'categoryImage': 'images/categories/makeup.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fmakeup.jpg?alt=media&token=2424b38e-d5ed-495b-980b-001c16b0296c'
  },
  {
    'categoryName': 'HAIR REMOVER',
    'categoryImage': 'images/categories/hair-removal-cream.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fhair-removal-cream.jpg?alt=media&token=94362f74-a3da-40f8-a05d-ad9a89a84792'
  }
];

var poojaSubCategories = [
  {
    'categoryName': 'AGARBATHI',
    'categoryImage': 'images/categories/agarbathi.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fagarbathi.jpg?alt=media&token=de3a30c7-1d00-422f-926d-ecc5bdd4f44d'
  },
  {
    'categoryName': 'WICKS',
    'categoryImage': 'images/categories/pooja-wicks.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fpooja-wicks.jpg?alt=media&token=e70b174d-8b55-419d-b334-9c8ac85f20fd'
  },
  {
    'categoryName': 'POOJA OILS',
    'categoryImage': 'images/categories/pooja-oil.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fpooja-oil.jpg?alt=media&token=ae21a192-7715-47c0-b59a-2668ec7e3d06'
  },
  {
    'categoryName': 'CAMPHOR',
    'categoryImage': 'images/categories/camphor.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fcamphor.jpg?alt=media&token=6f01551d-86a9-4b29-b816-7f28ebb0af48'
  },
  {
    'categoryName': 'LOBAN',
    'categoryImage': 'images/categories/dhoop.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fdhoop.jpg?alt=media&token=f3c70cac-db60-41fe-86c7-cd096f66e2d0'
  },
  {
    'categoryName': 'KUMKUM(ETC)',
    'categoryImage': 'images/categories/haldi-kumkum.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fhaldi-kumkum.jpg?alt=media&token=bdd66b2a-0819-4eaa-98bb-d0ef3f62e4d3'
  }
];

var oralSubCategories = [
  {
    'categoryName': 'TOOTHBRUSHES',
    'categoryImage': 'images/categories/toothbrushes.webp'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ftoothbrushes.webp?alt=media&token=dd24b185-1777-4e55-b89d-8281d77a0230'
  },
  {
    'categoryName': 'TOOTHPASTES',
    'categoryImage': 'images/categories/toothpaste.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ftoothpaste.jpg?alt=media&token=0222019b-260a-410b-a88f-24b46f6343fa'
  },
  {
    'categoryName': 'MOUTHWASH',
    'categoryImage': 'images/categories/mouthwash.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fmouthwash.jpg?alt=media&token=f6d422a2-ff16-4191-a47c-efa2b9431d8c'
  },
  {
    'categoryName': 'FLOSS & TONGUE CLEANERS',
    'categoryImage': 'images/categories/tongue-cleaner.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ftongue-cleaner.webp?alt=media&token=fb235bfc-430b-4e81-beae-5f7fb4a39a1d'
  }
];

var disposablesSubCategories = [
  {
    'categoryName': 'ALUMINIUM FOIL',
    'categoryImage': 'images/categories/aluminium-foil.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Faluminum-foil.jpg?alt=media&token=3b457134-a0a0-4e2d-a26c-73c31e612af2'
  },
  {
    'categoryName': 'CLING FILM',
    'categoryImage': 'images/categories/cling-film.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fcling-film.jpg?alt=media&token=af263306-170f-4134-929c-88db878ce3e2'
  },
  {
    'categoryName': 'GARBAGE BAGS',
    'categoryImage': 'images/categories/garbage-bags.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fgarbage-bags.jpg?alt=media&token=f8b6261b-f95b-4456-86d2-51ec40eef8e5'
  },
  {
    'categoryName': 'DISPOSABLE CUTLERY',
    'categoryImage': 'images/categories/disposables.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fdisposables.jpg?alt=media&token=0402adf1-3f45-48cf-9b62-c1bbeafa4c7f'
  },
  {
    'categoryName': 'TISSUES',
    'categoryImage': 'images/categories/paper-napkins.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fpaper-napkins.jpg?alt=media&token=d91404c2-16f8-435c-adf2-e00af9b4565b'
  }
];

// var stationerySubCategories = [
//   {
//   'categoryName':'PENS&PENCILS',
//   'categoryImage':'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fchips.jpg?alt=media&token=4aa62939-bb05-4645-9360-b0c9c29c557f'
// },
//   {
//   'categoryName':'NOTEBOOKS',
//   'categoryImage':'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fnamkeen.png?alt=media&token=2ffbc09a-35e3-4f8d-abc1-2ab63d069e8b'
// },
//   {
//   'categoryName':'COLORS',
//   'categoryImage':'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fpopcorn.jpg?alt=media&token=646a3924-4f47-4a68-9799-80d3a8e185d3'
// },
//   {
//   'categoryName':'ADHESIVES',
//   'categoryImage':'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fsweets.jpg?alt=media&token=fa3415b4-d91f-4cc6-9a57-e1ffba647113'
// },
//   {
//   'categoryName':'STAPLES',
//   'categoryImage':'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbiscuits.jpg?alt=media&token=a7ebcb49-b53a-4b23-8802-83a549b43c43'
// },
//   {
//   'categoryName':'FOLDERS',
//   'categoryImage':'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fchocolates.jpg?alt=media&token=f93ed1ad-0156-4e98-8c73-069baa2cd07b'
// }
// ];

var babySubCategories = [
  {
    'categoryName': 'BABY DIAPERS',
    'categoryImage': 'images/categories/baby-diapers.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbaby-diapers.jpg?alt=media&token=8f1500e0-21e6-4ac2-a35a-2701b0995622'
  },
  {
    'categoryName': 'BABY SOAPS',
    'categoryImage': 'images/categories/baby-soaps.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbaby-soaps.jpg?alt=media&token=f9051169-9557-4b71-b454-48440e169e2c'
  },
  {
    'categoryName': 'BABY SHAMPOOS',
    'categoryImage': 'images/categories/baby-shampoo.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbaby-shampoo.jpg?alt=media&token=6387a923-9618-4753-bb25-bdb9c94c478f'
  },
  {
    'categoryName': 'BABY OIL',
    'categoryImage': 'images/categories/baby-oil.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbaby-oil.jpg?alt=media&token=9f63bd1a-beba-4a2e-8b25-8b38c5c0b828'
  },
  {
    'categoryName': 'BABY POWDERS',
    'categoryImage': 'images/categories/baby-powder.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbaby-powder.jpg?alt=media&token=f68a4ec3-2a4b-40b5-be7c-0f9ff012e6d6'
  },
  {
    'categoryName': 'BABY LOTION',
    'categoryImage': 'images/categories/baby-lotion.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbaby-lotion.jpg?alt=media&token=167a9eb2-cc66-4cf6-b44c-33f38b7abed7'
  },
  {
    'categoryName': 'BABY HEALTH',
    'categoryImage': 'images/categories/baby-health.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fbaby-health.jpg?alt=media&token=6d14e079-a58e-469c-adaf-77f37322e691'
  }
];

var coolDrinksSubCategories = [
  {
    'categoryName': 'SOFT DRINKS',
    'categoryImage': 'images/categories/soft-drinks.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fsoft-drinks.jpg?alt=media&token=651767d4-8e45-4a2d-9616-24a8ddc80e7e'
  },
  {
    'categoryName': 'MILK SHAKES',
    'categoryImage': 'images/categories/milkshake.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fmilkshake.png?alt=media&token=86f52ae7-05bc-4da3-accf-e2734747e4b7'
  },
  {
    'categoryName': 'FRUIT JUICES',
    'categoryImage': 'images/categories/fruit-juice.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ffruit-juice.jpg?alt=media&token=c9ff317e-8def-4d5c-bfb3-cad4fd7eb20f'
  },
  {
    'categoryName': 'WATER',
    'categoryImage': 'images/categories/water.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fwater.jpg?alt=media&token=d2a61a9c-bee9-4d00-b7ab-6fa40338aaf2'
  },
  {
    'categoryName': 'ICE CREAMS',
    'categoryImage': 'images/categories/ice-creams.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fwater.jpg?alt=media&token=d2a61a9c-bee9-4d00-b7ab-6fa40338aaf2'
  },
];

var hotBeveragesSubCategories = [
  {
    'categoryName': 'TEA',
    'categoryImage': 'images/categories/tea.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fsoft-drinks.jpg?alt=media&token=651767d4-8e45-4a2d-9616-24a8ddc80e7e'
  },
  {
    'categoryName': 'COFFEE',
    'categoryImage': 'images/categories/coffee.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fmilkshake.png?alt=media&token=86f52ae7-05bc-4da3-accf-e2734747e4b7'
  },
  // {
  //   'categoryName': 'TEA & COFFEE MIXES',
  //   'categoryImage': 'images/categories/tea-coffee-mixes.jpg'
  //   // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ffruit-juice.jpg?alt=media&token=c9ff317e-8def-4d5c-bfb3-cad4fd7eb20f'
  // },
];

var homeNeedsSubCategories = [
    {
    'categoryName': 'BATTERIES',
    'categoryImage': 'images/categories/batteries.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fsoft-drinks.jpg?alt=media&token=651767d4-8e45-4a2d-9616-24a8ddc80e7e'
  },
  {
    'categoryName': 'PLASTIC HOME NEEDS',
    'categoryImage': 'images/categories/plastic.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fsoft-drinks.jpg?alt=media&token=651767d4-8e45-4a2d-9616-24a8ddc80e7e'
  },
  {
    'categoryName': 'STEEL HOME NEEDS',
    'categoryImage': 'images/categories/steel.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fmilkshake.png?alt=media&token=86f52ae7-05bc-4da3-accf-e2734747e4b7'
  },
  {
    'categoryName': 'ELECTRICAL ACCESSORIES',
    'categoryImage': 'images/categories/electrical-accessories.jpg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Ffruit-juice.jpg?alt=media&token=c9ff317e-8def-4d5c-bfb3-cad4fd7eb20f'
  },
];

var freshNonVegSubCategories = [
    {
    'categoryName': 'CHICKEN',
    'categoryImage': 'images/categories/chicken-live.jpeg'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fsoft-drinks.jpg?alt=media&token=651767d4-8e45-4a2d-9616-24a8ddc80e7e'
  },
  {
    'categoryName': 'MUTTON',
    'categoryImage': 'images/categories/goat-live-2.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fsoft-drinks.jpg?alt=media&token=651767d4-8e45-4a2d-9616-24a8ddc80e7e'
  },
  {
    'categoryName': 'SEAFOOD',
    'categoryImage': 'images/categories/sea-food.png'
    // 'https://firebasestorage.googleapis.com/v0/b/oshop-21421.appspot.com/o/homecategorybanners%2Fmilkshake.png?alt=media&token=86f52ae7-05bc-4da3-accf-e2734747e4b7'
  } 
];

class ShowAllCategories extends StatefulWidget {
  @override
  _ShowAllCategoriesState createState() => _ShowAllCategoriesState();
}

class _ShowAllCategoriesState extends State<ShowAllCategories> {
  @override
  Widget build(BuildContext context) {
    final title = 'GROCERY CART';

    return 
    // MaterialApp(
    //     title: title,
    //     home: Scaffold(
    //       appBar: AppBar(
    //         title: Text(title),
    //       ),
    //       body: 
    
          Expanded(
                      child: ListView(
              children: <Widget>[
                buildHomeCategoryWidget(context, 'GREENZ', greenzSubCategories),
                buildHomeCategoryWidget(context, 'NON-VEG', freshNonVegSubCategories),
                buildHomeCategoryWidget(context, 'KIRANA ITEMS', kiranaSubCategories),
                buildHomeCategoryWidget(context, 'HERBS & SPICES', spicesSubCategories),
                buildHomeCategoryWidget(context, 'EDIBLE OILS', edibleOilsSubCategories),
                buildHomeCategoryWidget(context, 'TEA & COFFEE', hotBeveragesSubCategories),
                buildHomeCategoryWidget(context, 'PICKLES&CHUTNEYS', picklesChutneyPowderSubCategories),
                buildHomeCategoryWidget(context, 'INSTANT FOOD', instantFoodSubCategories),
                buildHomeCategoryWidget(context, 'BREAKFAST', breakfastSubCategories),
                buildHomeCategoryWidget(context, 'DAIRY', dairySubCategories),
                buildHomeCategoryWidget(context, 'SNACKS', snacksSubCategories),
                buildHomeCategoryWidget(context, 'COOL DRINKS', coolDrinksSubCategories),
                buildHomeCategoryWidget(context, 'FABRIC CARE', fabricSubCategories),
                buildHomeCategoryWidget(context, 'DISH WASH', dishwashSubCategories),
                buildHomeCategoryWidget(context, 'CLEANERS', homeSubCategories),
                buildHomeCategoryWidget(context, 'PEST CONTROL', pestControlSubCategories),
                buildHomeCategoryWidget(context, 'BATH & BEAUTY', personalSubCategories),
                buildHomeCategoryWidget(context, 'ORAL CARE', oralSubCategories),
                buildHomeCategoryWidget(context, 'HAIR CARE', hairCareSubCategories),
                buildHomeCategoryWidget(context, 'SHAVING NEEDS', shavingSubCategories),
                buildHomeCategoryWidget(context, 'DEODORANTS', deoSubCategories),
                buildHomeCategoryWidget(context, 'FEMININE HYGIENE', feminineHygieneSubCategories),
                buildHomeCategoryWidget(context, 'BABY CARE', babySubCategories),
                buildHomeCategoryWidget(context, 'POOJA NEEDS', poojaSubCategories),
                buildHomeCategoryWidget(context, 'DISPOSABLES', disposablesSubCategories),
                buildHomeCategoryWidget(context, 'HOME NEEDS', homeNeedsSubCategories),
                
                
                
              
                // buildHomeCategoryWidget(
                // buildHomeCategoryWidget(
                //     context, 'STATIONERY', stationerySubCategories),
                // buildHomeCategoryWidget(
                //     context, 'PLASTIC HOME NEEDS', plasticSubCategories),
                // buildHomeCategoryWidget(
                //     context, 'STEEL HOME NEEDS', steelSubCategories),
              ],
            ),
          );
        // ));
  }
}

Widget buildSubCategoryWidget(BuildContext context, List subCategories) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: subCategories.length,
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: () {
          categorySelected = subCategories[index]['categoryName'];
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return CategoryProductsListViewStreamBuilder();
          }));
        },
        child: Stack(children: <Widget>[
          Container(
              // margin: const EdgeInsets.all(5.0),
              width: 150.0,
              height: 120.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.blueGrey[300]),
                image: DecorationImage(
                  image: AssetImage(subCategories[index]['categoryImage']),
                  fit: BoxFit.contain,
                ),
              )),
          Positioned(
            left: 25.0,
            bottom: 0.0,
            child: Container(
              height: 20.0,
              child: Text(
                subCategories[index]['categoryName'],
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
                maxLines: 2,
                softWrap: true,
              ),
            ),
          ),
        ]),
      );
    },
  );
}

// Widget buildSubCategoryWidget(BuildContext context, List subCategories) {
//   return ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemCount: subCategories.length,
//     itemBuilder: (BuildContext context, int index) {
//       return Column(children: <Widget>[
//         Container(
//           height: 20.0,
//           child: Text(
//             subCategories[index]['categoryName'],
//             style: TextStyle(
//               color: Colors.black,
//               fontFamily: "Montserrat",
//               fontWeight: FontWeight.bold,
//               fontSize: 18.0,
//             ),
//           ),
//         ),
//         Container(
//             margin: const EdgeInsets.all(5.0),
//             width: 150.0,
//             height: 120.0,
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               color: Color(0xFFFFFFFF),
//               borderRadius: BorderRadius.circular(8.0),
//               border: Border.all(color: Colors.blueGrey[300]),
//               image: DecorationImage(
//                 image: NetworkImage(subCategories[index]['categoryImage']),
//                 fit: BoxFit.contain,
//               ),
//             )),
//         ]
//       );
//     },
//   );
// }

Widget buildHomeCategoryWidget(
    BuildContext context, String categoryName, List subCategories) {
  return Column(children: <Widget>[
    const SizedBox(
      height: 10.0,
    ),
    Container(
      alignment: Alignment.centerLeft,
      child: Text(categoryName,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat',
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            // backgroundColor: Colors.blueGrey
          )),
    ),
    Container(
        // margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: buildSubCategoryWidget(context, subCategories)),
    const SizedBox(
      height: 10.0,
    ),
  ]);
}
