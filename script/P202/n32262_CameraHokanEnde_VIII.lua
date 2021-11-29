-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 556.581543 , 142.949600 , 9.247768 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 555.149841 , 141.387985 , 8.937769 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 553.853943 , 140.544434 , 8.887769 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 551.894531 , 139.150558 , 8.767769 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
