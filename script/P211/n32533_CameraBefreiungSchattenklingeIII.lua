-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 257.605103 , 216.119522 , 30.304590 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(265.688,203.214,26.300);]] )
   Camera:MotionSpline_AddSplinePoint( 257.605103 , 216.119522 , 30.304590 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(265.688,203.214,26.300);]] )
   Camera:MotionSpline_AddSplinePoint( 257.605103 , 216.119522 , 30.304590 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(265.688,203.214,26.300);]] )
   Camera:MotionSpline_AddSplinePoint( 257.605103 , 216.119522 , 30.304590 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(265.688,203.214,26.300);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
