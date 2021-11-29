-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 313.939880 , 208.687195 , 16.534853 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10286);]] )
   Camera:MotionSpline_AddSplinePoint( 314.362946 , 207.150452 , 16.534853 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10286);]] )
   Camera:MotionSpline_AddSplinePoint( 314.835632 , 205.433319 , 16.534853 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10286);]] )
   Camera:MotionSpline_AddSplinePoint( 315.223816 , 204.023300 , 16.534853 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10286);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
