-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 368.525787 , 264.519073 , 27.440165 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 369.118774 , 267.334656 , 27.440165 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 369.563477 , 269.446411 , 27.440165 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 370.335571 , 273.112732 , 27.440165 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
