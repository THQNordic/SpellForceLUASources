-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 367.364929 , 257.945251 , 25.948280 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10153);]] )
   Camera:MotionSpline_AddSplinePoint( 368.354004 , 258.423737 , 25.948280 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 369.454071 , 258.955933 , 25.948280 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 370.557709 , 259.489838 , 25.948280 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 18.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
