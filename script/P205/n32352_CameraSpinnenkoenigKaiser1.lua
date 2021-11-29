-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 333.986053 , 532.361206 , 30.971256 , 4.099998 , [[Camera:ScriptSplineLookAtNpc(9305);]] )
   Camera:MotionSpline_AddSplinePoint( 330.404999 , 548.363892 , 24.971317 , 2.700000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 323.701019 , 574.606445 , 20.766434 , 3.399999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 315.011902 , 582.496460 , 20.726442 , 3.999998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 311.393066 , 590.511780 , 20.062601 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 4.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
