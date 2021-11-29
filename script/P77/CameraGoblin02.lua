-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 201.764267 , 181.417633 , 12.725801 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5195);]] )
   Camera:MotionSpline_AddSplinePoint( 201.764267 , 181.417633 , 12.725801 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5195);]] )
   Camera:MotionSpline_AddSplinePoint( 201.764267 , 181.417633 , 12.725801 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5195);]] )
   Camera:MotionSpline_AddSplinePoint( 201.764267 , 181.417633 , 12.725801 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5195);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 40.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
