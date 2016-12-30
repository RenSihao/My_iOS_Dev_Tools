//
//  MyFloatLayout.h
//  MyLayout
//
//  Created by oybq on 16/2/18.
//  Copyright © 2016年 YoungSoft. All rights reserved.
//

#import "MyBaseLayout.h"



@interface UIView(MyFloatLayoutExt)

/**
 *是否反方向浮动，默认是NO表示正向浮动，具体方向则根据浮动布局视图的方向。如果是垂直布局则默认是向左浮动的，如果是水平布局则默认是向上浮动的。
  如果这个值设置为YES则当布局是垂直布局时则向右浮动，而如果是水平布局则向下浮动。
 */
@property(nonatomic,assign,getter=isReverseFloat)  BOOL reverseFloat;

/**
 *清除浮动，默认是NO。这个属性也跟布局视图的方向相关。如果设置为了清除浮动属性则表示本子视图不会在浮动方向上紧跟在前一个浮动子视图的后面，而是会另外新起一行或者一列来进行布局。reverseFloat和clearFloat这两个属性的定义是完全参考CSS样式表中浮动布局中的float和clear这两个属性。
 */
@property(nonatomic,assign)  BOOL clearFloat;


/**
 *浮动视图的尺寸的比重。默认值是0, 值的设定指定在0和1之间。这个属性的意义根据浮动布局视图的方向而不同。
 *当浮动布局视图是垂直布局时，这个属性用来设置宽度占用当前的剩余宽度的比重，这样子视图就不需要明确的设定宽度值。
 *当浮动布局视图是水平布局时，这个属性用来设置高度占用当前的剩余高度的比重，这样子视图就不需要明确的设定高度值。
 
 举例来说，假设布局视图的宽度是100，而当前视图的前面一个视图已经占据了20的宽度，那么当设置当前视图的weight为1时则当前视图的宽度就会被设定为80。这样当前视图是不会浮动
 到一个新的行的。而如果设定为0.8则当前视图的宽度则为(100-20)*0.8 = 64了。
 */
@property(nonatomic, assign)  CGFloat weight;



@end



/**
 * 浮动布局是一种里面的子视图按照约定的方向浮动停靠，当尺寸不足以被容纳时会自动寻找最佳的位置进行浮动停靠的布局视图。
 *浮动布局的理念源于HTML/CSS中的浮动定位技术,因此浮动布局可以专门用来实现那些不规则布局或者图文环绕的布局。
 *根据浮动的方向不同，浮动布局可以分为左右浮动布局和上下浮动布局。
 */
@interface MyFloatLayout : MyBaseLayout


/**
 *初始化一个浮动布局并指定布局的方向。当方向设置为MyLayoutViewOrientation_Vert时表示为左右浮动布局视图，而设置为MyLayoutViewOrientation_Horz则表示为上下浮动布局视图。
 */
-(id)initWithOrientation:(MyLayoutViewOrientation)orientation;
+(id)floatLayoutWithOrientation:(MyLayoutViewOrientation)orientation;

/**
 *浮动布局的方向。
 *如果是MyLayoutViewOrientation_Vert则表示从左到右，从上到下的垂直布局方式，这个方式是默认方式。
 *如果是MyLayoutViewOrientation_Horz则表示从上到下，从左到右的水平布局方式
 */
@property(nonatomic,assign) MyLayoutViewOrientation orientation;



/**
 *浮动布局内所有子视图的整体停靠对齐位置设定，默认是MyMarginGravity_None
 *如果视图方向为MyLayoutViewOrientation_Vert时则水平方向的停靠失效。只能设置MyMarginGravity_Vert_Top,MyMarginGravity_Vert_Center,MyMarginGravity_Vert_Bottom 三个值。
 *如果视图方向为MyLayoutViewOrientation_Horz时则垂直方向的停靠失效。只能设置MyMarginGravity_Horz_Left,MyMarginGravity_Horz_Center,MyMarginGravity_Horz_Right
 */
@property(nonatomic,assign)  MyMarginGravity gravity;



/**
 *子视图之间的垂直和水平的间距，默认为0。当子视图之间的间距是固定时可以通过直接设置这两个属性值来指定间距而不需要为每个子视图来设置margin值。
 */
@property(nonatomic ,assign)  CGFloat subviewVertMargin;
@property(nonatomic, assign)  CGFloat subviewHorzMargin;
@property(nonatomic, assign)  CGFloat subviewMargin;  //同时设置水平和垂直间距。

/**
 *不做布局边界的限制，子视图不会自动换行，因此当设置为YES时，子视图需要设置clearFloat来实现主动换行的处理。默认为NO。
 *当布局的orientation为MyLayoutViewOrientation_Vert并且wrapContentWidth为YES时,这个属性设置为YES才生效。
 *当布局的orientation为MyLayoutViewOrientation_Horz并且wrapContentHeight为YES时，这个属性设置为YES才生效。
 *当属性设置为YES时，子视图不能将扩展属性reverseFloat设置为YES，同时不能设置weight属性，否则将导致结果异常。
 *这个属性设置为YES时，在左右浮动布局中，子视图只能向左浮动，并且没有右边界的限制，因此如果子视图没有clearFloat时则总是排列在前一个子视图的右边，并不会自动换行,因此为了让这个属性生效，布局视图必须要同时设置wrapContentWidth为YES。
 *这个属性设置为YES时，在上下浮动布局中，子视图只能向上浮动，并且没有下边界的限制，因此如果子视图没有设置clearFloat时则总是排列在前一个子视图的下边，并不会自动换行，因此为了让这个属性生效，布局视图必须要同时设置wrapContentHeight为YES.
 */
@property(nonatomic,assign) BOOL noBoundaryLimit;

/**
 *根据浮动视图的方向设置子视图的间距为浮动间距而不是上面确定的固定间距。在一些应用场景我们有时候希望某些子视图的宽度是固定的情况下，子视图的间距是浮动的而不是固定的。因此您可以通过如下方法来设置浮动间距。这个方法会根据您当前布局的orientation方向不同而意义不同：
 1.如果您的布局方向是MyLayoutViewOrientation_Vert表示设置的是子视图的水平间距，其中的subviewSize指定的是子视图的宽度，minMargin指定的是最小的水平间距。
 2.如果您的布局方向是MyLayoutViewOrientation_Horz表示设置的是子视图的垂直间距，其中的subviewSize指定的是子视图的高度，minMargin指定的是最小的垂直间距。
 3.如果您不想使用浮动间距则请将subviewSize设置为0就可以了。
 */
-(void)setSubviewFloatMargin:(CGFloat)subviewSize minMargin:(CGFloat)minMargin;
-(void)setSubviewFloatMargin:(CGFloat)subviewSize minMargin:(CGFloat)minMargin inSizeClass:(MySizeClass)sizeClass;


@end
