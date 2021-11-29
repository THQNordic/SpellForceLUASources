-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 211.348099 , 426.863373 , 53.550968 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 206.567871 , 426.651428 , 52.902096 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 201.760727 , 426.438293 , 52.320972 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 192.183594 , 426.013672 , 51.000973 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 6.523438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
