-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 579.762268 , 407.067841 , 69.424828 , 24.800058 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 577.399963 , 405.041595 , 67.214828 , 16.500027 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 575.323120 , 402.723358 , 66.224823 , 24.700058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 573.567688 , 400.153107 , 65.344826 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
